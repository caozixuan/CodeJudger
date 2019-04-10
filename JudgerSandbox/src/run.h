//
// Created by yiner on 2019/4/1.
//

#ifndef JUDGERSANDBOX_RUN_H
#define JUDGERSANDBOX_RUN_H

#include <sys/types.h>

#define ARGS_MAX_NUM 256
#define ENV_MAX_NUM 256
#define UNLIMITED (-1)

#define LOG_ERROR(error_code) LOG_FATAL(log_fp, "Error: "#error_code);

#define ERROR_EXIT(error_code)\
    {\
        LOG_ERROR(error_code);  \
        _result->error = error_code; \
        log_close(log_fp);  \
        return; \
    }

struct config {
    int max_cpu_time;
    int max_real_time;
    long max_memory;
    long max_stack;
    int max_process_num;
    long max_output_size;
    char *exe_path;
    char *input_path;
    char *output_path;
    char *error_path;
    char *args[ARGS_MAX_NUM];
    char *env[ENV_MAX_NUM];
    char *log_path;
    char *seccomp_rules;
    uid_t uid;
    gid_t gid;
};

struct result {
    int cpu_time;
    int real_time;
    long memory;
    int signal;
    int exitcode;
    int error;
    int result;
};


// exit code
enum {
    SUCCESS = 0,
    INVALID_CONFIG = -1,
    FORK_FAILED = -2,
    PTHREAD_FAILED = -3,
    WAIT_FAILED = -4,
    ROOT_REQUIRED = -5
};

// child exit code
enum {
    WRONG_ANSWER = -1,
    CPU_TIME_LIMIT_EXCEEDED = 1,
    REAL_TIME_LIMIT_EXCEEDED = 2,
    MEMORY_LIMIT_EXCEEDED = 3,
    RUNTIME_ERROR = 4,
    SYSTEM_ERROR = 5
};


void run(struct config*, struct result*);

#endif //JUDGERSANDBOX_RUN_H
