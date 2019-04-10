//
// Created by yiner on 2019/4/1.
//

#include <signal.h>
#include <pthread.h>
#include "kill.h"

int kill_process(pid_t pid) {
    return kill(pid, SIGKILL);
}

/**
 * Monitor the child process, kill the child process if timeout.
 * @param timeout_args
 * @return NULL
 */
void *timeout_kill(void *timeout_args) {
    pid_t pid = ((struct timeout_args*)timeout_args)->pid;
    int timeout = ((struct timeout_args*)timeout_args)->timeout;

    /**
     * pthread_detach() sets the state of the thread to detached,
     * and all resources are automatically released when the thread finishes running.
     * On success, pthread_detach() returns 0; on error, it returns an error number.
     * If error, kill and exit.
     */
    if (pthread_detach(pthread_self()) != 0) {
        kill_process(pid);
        return NULL;
    }

    // sleep to hang on, and wait
    // sleep: second
    // timeout: millisecond -> /1000 second
    // + 1000 in sure that the sleep second is bigger than 0
    if (sleep((unsigned int)((timeout + 1000)/1000)) != 0) {
        kill_process(pid);
        return NULL;
    }

    // timeout and kill
    if (kill_process(pid) != 0) return NULL;

    return NULL;

}