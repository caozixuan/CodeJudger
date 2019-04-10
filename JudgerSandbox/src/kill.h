//
// Created by yiner on 2019/4/1.
//

#ifndef JUDGERSANDBOX_KILL_H
#define JUDGERSANDBOX_KILL_H

#include <unistd.h>

struct timeout_args {
    int timeout;
    pid_t pid;
};

int kill_process(pid_t pid);

void *timeout_kill(void *timeout_args);

#endif //JUDGERSANDBOX_KILL_H
