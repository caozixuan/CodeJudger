//
// Created by yiner on 2019/4/1.
//

/*
 * access to lots of nonstandard GNU/Linux extension functions
 * and access to low-level functions that cannot be portable
 */
//#define _GNU_SOURCE
//#define _POSIX_SOURCE

#include "run.h"

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

#include <sys/types.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/wait.h>

#include "child.h"
#include "kill.h"
#include "log.h"

/*
 * An util to convert a timeval to milliseconds
 */
double tv2ms(struct timeval tv){
    return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

void init_result(struct result *_result) {
    _result->result = _result->error = SUCCESS;
    _result->cpu_time = _result->real_time = _result->signal = _result->exitcode = 0;
    _result->memory = 0;
};

void set_result(struct config* _config, struct result *_result, int status, struct rusage *resource_usage) {
    if (WIFSIGNALED(status) != 0) {
        _result->signal = WTERMSIG(status);
    }

    if (_result->signal == SIGUSR1) {
        _result->signal = SYSTEM_ERROR;
    }
    else {
        _result->exitcode = WEXITSTATUS(status);
        _result->cpu_time = (int) tv2ms(resource_usage->ru_utime);
        _result->memory = resource_usage->ru_maxrss * 1024;

        if (_result->exitcode != 0) {
            _result->result = RUNTIME_ERROR;
        }

        if (_result->signal == SIGSEGV) {
            if (_config->max_memory != UNLIMITED && _result->memory > _config->max_memory) {
                _result->result = MEMORY_LIMIT_EXCEEDED;
            }
            else {
                _result->result = RUNTIME_ERROR;
            }
        }
        else {
            if (_result->signal != 0) {
                _result->result = RUNTIME_ERROR;
            }
            if (_config->max_memory != UNLIMITED && _result->memory > _config->max_memory) {
                _result->result = MEMORY_LIMIT_EXCEEDED;
            }
            if (_config->max_real_time != UNLIMITED && _result->real_time > _config->max_real_time) {
                _result->result = REAL_TIME_LIMIT_EXCEEDED;
            }
            if (_config->max_cpu_time != UNLIMITED && _result->cpu_time > _config->max_cpu_time) {
                _result->result = CPU_TIME_LIMIT_EXCEEDED;
            }
        }
    }

}

void run(struct config* _config, struct result *_result){

    //init log file pointer
    FILE *log_fp = log_open(_config->log_path);

    // init result
    init_result(_result);

    // check whether current user is root
    uid_t uid = getuid();
    if (uid != 0) {
        ERROR_EXIT(ROOT_REQUIRED);
    }

    // check args
    if ((_config->max_cpu_time < 1 && _config->max_cpu_time != UNLIMITED) ||
        (_config->max_real_time < 1 && _config->max_real_time != UNLIMITED) ||
        (_config->max_stack < 1) ||
        (_config->max_memory < 1 && _config->max_memory != UNLIMITED) ||
        (_config->max_process_num < 1 && _config->max_process_num != UNLIMITED) ||
        (_config->max_output_size < 1 && _config->max_output_size != UNLIMITED))
            ERROR_EXIT(INVALID_CONFIG);

    // record current time
    struct timeval start, end;
    gettimeofday(&start, NULL);

    pid_t child_pid = fork();

    // fork failed
    if (child_pid < 0) {
        ERROR_EXIT(FORK_FAILED);
    }
    else if (child_pid == 0) { // child process
        child_process(log_fp, _config);
    }
    else if (child_pid > 0) { // father process

        // create new thread to monitor child process running time if real time is limited
        pthread_t tid = 0;
        if (_config->max_real_time != UNLIMITED) {
            struct timeout_args kill_args;
            kill_args.timeout = _config->max_real_time;
            kill_args.pid = child_pid;

            /**
             * int pthread_create(pthread_t *tid, const pthread_attr_t *attr,
             *                     (void*)(*start_rtn)(void*),void *arg);
             */
            if (pthread_create(&tid, NULL, timeout_kill, (void *) (&kill_args)) != 0) {
                kill_process(child_pid);
                ERROR_EXIT(PTHREAD_FAILED);
            }
        }

        // records of child process
        int status;
        struct rusage resource_usage;

        /**
         * pid_t wait4(pid_t pid,int *status,int options,struct rusage *rusage);
         * Wait for child process to terminate.
         * On success, returns pid of the child whose state has changed.
         * On error, returns -1.
         */
        if (wait4(child_pid, &status, WSTOPPED, &resource_usage) == -1) {
            kill_process(child_pid);
            ERROR_EXIT(WAIT_FAILED);
        }

        // get end time
        gettimeofday(&end, NULL);
        // real_time: ms
        _result->real_time = (int) (tv2ms(end) - tv2ms(start));

        // when child process exited, cancel timeout kill thread
        if (_config->max_real_time != UNLIMITED) {
            if (pthread_cancel(tid) != 0) {
                // todo logging
            }
        }
        
        // set result
        set_result(_config, _result, status, &resource_usage);

        // close log file pointer
        log_close(log_fp);
    }

}