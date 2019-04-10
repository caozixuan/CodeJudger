//
// Created by yiner on 2019/4/1.
//

#include <sys/resource.h>
#include <sys/types.h>
#include <unistd.h>
#include <grp.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include "child.h"
#include "log.h"
#include "seccmp_rules.h"

FILE *input_file, *output_file, *error_file = NULL;

void close_file(FILE * fp) {
    if (fp != NULL) {
        fclose(fp);
    }
}

// set up limitation for execution
void set_limit(FILE *log_fp, struct config *_config){
    if (_config->max_cpu_time != UNLIMITED) {
        struct rlimit max_cpu_time;
        max_cpu_time.rlim_cur = max_cpu_time.rlim_max = (rlim_t)_config->max_cpu_time;
        if (setrlimit(RLIMIT_CPU, &max_cpu_time) != 0) {
            CHILD_ERROR_EXIT(SETRLIMIT_FAILED);
        }
    }

    if (_config->max_memory != UNLIMITED) {
        struct rlimit max_memory;
        max_memory.rlim_cur = max_memory.rlim_max = (rlim_t)_config->max_memory;
        if (setrlimit(RLIMIT_AS, &max_memory) != 0) {
            CHILD_ERROR_EXIT(SETRLIMIT_FAILED);
        }
    }

    if (_config->max_stack != UNLIMITED) {
        struct rlimit max_stack;
        max_stack.rlim_cur = max_stack.rlim_max = (rlim_t)_config->max_stack;
        if (setrlimit(RLIMIT_STACK, &max_stack) != 0) {
            CHILD_ERROR_EXIT(SETRLIMIT_FAILED);
        }
    }

    if (_config->max_process_num != UNLIMITED) {
        struct rlimit max_process_num;
        max_process_num.rlim_cur = max_process_num.rlim_max = (rlim_t)_config->max_process_num;
        if (setrlimit(RLIMIT_NPROC, &max_process_num) != 0) {
            CHILD_ERROR_EXIT(SETRLIMIT_FAILED);
        }
    }

    if (_config->max_output_size != UNLIMITED) {
        struct rlimit max_output_size;
        max_output_size.rlim_cur = max_output_size.rlim_max = (rlim_t)_config->max_output_size;
        if (setrlimit(RLIMIT_FSIZE, &max_output_size) != 0) {
            CHILD_ERROR_EXIT(SETRLIMIT_FAILED);
        }
    }



}

// open files
void open_files(FILE *log_fp, struct config *_config){

    // input
    if (_config->input_path != NULL) {
        input_file = fopen(_config->input_path, "r");
        if (input_file == NULL) {
            CHILD_ERROR_EXIT(DUP2_FAILED);
        }

        // redirect stdin to input_file
        if (dup2(fileno(input_file), fileno(stdin)) == -1) {
            CHILD_ERROR_EXIT(DUP2_FAILED);
        }

    }

    // output
    if (_config->output_path != NULL) {
        output_file = fopen(_config->output_path, "w");
        if (output_file == NULL) {
            CHILD_ERROR_EXIT(DUP2_FAILED);
        }

        // redirect stdout to output_file
        if (dup2(fileno(output_file), fileno(stdout)) == -1) {
            CHILD_ERROR_EXIT(DUP2_FAILED);
        }

    }

    // error
    if (_config->error_path != NULL) {
        error_file = fopen(_config->error_path, "w");
        if (error_file == NULL) {
            CHILD_ERROR_EXIT(DUP2_FAILED);
        }

        // redirect stderr to error_file
        if (dup2(fileno(error_file), fileno(stderr)) == -1) {
            CHILD_ERROR_EXIT(DUP2_FAILED);
        }

    }
}

// set id and group
void set_id(FILE *log_fp, struct config *_config) {
    if (_config->uid<0 && setuid(_config->uid) == -1 ) {
        CHILD_ERROR_EXIT(SETID_FAILED);
    }

    if (_config->gid<0 && setgid(_config->gid) == -1 ) {
        CHILD_ERROR_EXIT(SETID_FAILED);
    }

    // set process group
    gid_t group_list[] = {_config->gid};
    if (setgroups(sizeof(group_list)/ sizeof(gid_t), group_list) == -1) {
        CHILD_ERROR_EXIT(SETID_FAILED);
    }

}

// load seccomp
void load_seccmp(FILE *log_fp, struct config *_config) {
    if (_config->seccomp_rules != NULL) {

        if (strcmp(_config->seccomp_rules,"general") == 0) {
            if (set_seccmp_rules(_config) != SUCCESS) {
                CHILD_ERROR_EXIT(LOAD_SECCOMP_FAILED);
            }
        }
        else if (strcmp(_config->seccomp_rules,"general_io") == 0) {
            if (set_seccmp_rules_io(_config) != SUCCESS) {
                CHILD_ERROR_EXIT(LOAD_SECCOMP_FAILED);
            }
        }
        else {
            CHILD_ERROR_EXIT(LOAD_SECCOMP_FAILED);
        }
    }

}

void child_process(FILE *log_fp, struct config *_config){
    // set up limitation for execution
    set_limit(log_fp, _config);

    // open files
    open_files(log_fp, _config);

    // set id
    set_id(log_fp, _config);

    // load seccomp
    load_seccmp(log_fp, _config);

    // execute
    execve(_config->exe_path, _config->args, _config->env);

    CHILD_ERROR_EXIT(EXECVE_FAILED);

}