//
// Created by yiner on 2019/4/1.
//

#ifndef JUDGERSANDBOX_CHILD_H
#define JUDGERSANDBOX_CHILD_H

#include <unistd.h>
#include <stdio.h>
#include "run.h"

#define CHILD_ERROR_EXIT(errorcode)\
    {\
        LOG_FATAL(log_fp, "Error: System errno: %s; Internal errno: "#errorcode, strerror(errno));\
        close_file(input_file);\
        close_file(output_file);\
        close_file(error_file);\
        raise(SIGUSR1);\
        exit(EXIT_FAILURE);\
    }

// child error exit code
enum {
    SETRLIMIT_FAILED = -6,
    DUP2_FAILED = -7,
    SETID_FAILED = -8,
    LOAD_SECCOMP_FAILED = -9,
    EXECVE_FAILED = -10,
    SPJ_ERROR = -11
};

void child_process(FILE *, struct config *);


#endif //JUDGERSANDBOX_CHILD_H
