//
// Created by yiner on 2019/4/4.
//

#include "seccmp_rules.h"
#include "child.h"
#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdbool.h>
#include <seccomp.h>

// not allow write
int set_seccmp_rules(struct config * _config) {
    return _set_seccmp_rules(_config, false);
}

// allow write
int set_seccmp_rules_io(struct config *_config) {
    return _set_seccmp_rules(_config, true);
}

int _set_seccmp_rules(struct config * _config, bool allowWrite) {

    // fliter context
    scmp_filter_ctx ctx;

    // init context
    if ((ctx = seccomp_init(SCMP_ACT_KILL)) == NULL) {
        return LOAD_SECCOMP_FAILED;
    }

    // create list
    int syscall_white_list[] = {
            SCMP_SYS(read), SCMP_SYS(fstat),
            SCMP_SYS(mmap), SCMP_SYS(mprotect),
            SCMP_SYS(munmap), SCMP_SYS(uname),
            SCMP_SYS(arch_prctl), SCMP_SYS(brk),
            SCMP_SYS(access), SCMP_SYS(exit_group),
            SCMP_SYS(close), SCMP_SYS(readlink),
            SCMP_SYS(sysinfo), SCMP_SYS(write),
            SCMP_SYS(writev), SCMP_SYS(lseek)
    };

    int white_list_length = sizeof(syscall_white_list)/ sizeof(int);

    // add rules for allowed system calls
    for (int i = 0; i < white_list_length ; ++i) {
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, syscall_white_list[i],0) < 0) {
            return LOAD_SECCOMP_FAILED;
        }
    }

    // add extra rule for execve
    if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(execve), 1, SCMP_A0(SCMP_CMP_EQ, (scmp_datum_t)(_config->exe_path))) != 0) {
        return LOAD_SECCOMP_FAILED;
    }

    if (!allowWrite) {
        // do not allow "w" and "rw" using open
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(open), 1, SCMP_CMP(1, SCMP_CMP_MASKED_EQ, O_WRONLY | O_RDWR, 0)) != 0) {
            return LOAD_SECCOMP_FAILED;
        }
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(openat), 1, SCMP_CMP(2, SCMP_CMP_MASKED_EQ, O_WRONLY | O_RDWR, 0)) != 0) {
            return LOAD_SECCOMP_FAILED;
        }
    }
    else {
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(open), 0) != 0) {
            return LOAD_SECCOMP_FAILED;
        }
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(openat), 0) != 0) {
            return LOAD_SECCOMP_FAILED;
        }
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(dup), 0) != 0) {
            return LOAD_SECCOMP_FAILED;
        }
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(dup2), 0) != 0) {
            return LOAD_SECCOMP_FAILED;
        }
        if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(dup3), 0) != 0) {
            return LOAD_SECCOMP_FAILED;
        }
    }

    // load seccomp context
    if (seccomp_load(ctx) != 0) {
        return LOAD_SECCOMP_FAILED;
    }

    // release context
    seccomp_release(ctx);

    return SUCCESS;
}