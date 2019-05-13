import json
import subprocess

UNLIMITED = -1
VERSION = 0x010000

RESULT_SUCCESS = 0
RESULT_WRONG_ANSWER = -1
RESULT_CPU_TIME_LIMIT_EXCEEDED = 1
RESULT_REAL_TIME_LIMIT_EXCEEDED = 2
RESULT_MEMORY_LIMIT_EXCEEDED = 3
RESULT_RUNTIME_ERROR = 4
RESULT_SYSTEM_ERROR = 5

ERROR_INVALID_CONFIG = -1
ERROR_FORK_FAILED = -2
ERROR_PTHREAD_FAILED = -3
ERROR_WAIT_FAILED = -4
ERROR_ROOT_REQUIRED = -5
ERROR_SETRLIMIT_FAILED = -6
ERROR_DUP2_FAILED = -7
ERROR_SETUID_FAILED = -8
ERROR_LOAD_SECCOMP_FAILED = -9
ERROR_EXECVE_FAILED = -10
ERROR_SPJ_ERROR = -11

def run(max_cpu_time, max_real_time, max_memory,
        max_stack, max_output_size, max_process_number,
        exe_path, input_path, output_path, error_path,
        args, env, log_path, seccomp_rules,
        uid, gid):

    # init vars
    int_vars = ["max_cpu_time", "max_real_time", "max_memory", 
                "max_stack", "max_output_size", "max_process_number", 
                "uid", "gid"]
    str_vars = ["exe_path", "input_path", "output_path", "error_path", 
                "log_path"]
    str_list_vars = ["args", "env"]

    prog_args = ["../../output/libJudgerSandbox.so"]

    # check args
    for var in int_vars:
        value = vars()[var]
        if not isinstance(value, int):
            raise ValueError("{} must be a int!".format(var))
        if value != UNLIMITED:
            prog_args.append("--{}={}".format(var, value))

    for var in str_vars:
        value = vars()[var]
        if not isinstance(value, str):
            raise ValueError("{} must be a string!".format(var))
        prog_args.append("--{}={}".format(var, value))

    for var in str_list_vars:
        value = vars()[var]
        if not isinstance(value, list):
            raise ValueError("{} must be a list!".format(var))
        for item in value:
            if not isinstance(item, str):
                raise ValueError("{} item must be a string!".format(var))
            prog_args.append("--{}={}".format(var, item))

    if seccomp_rules is not None and not isinstance(seccomp_rules, str):
        raise ValueError("seccomp_rules must be a str or None!")
    if seccomp_rules:
        prog_args.append("--seccomp_rules={}".format(seccomp_rules))

    # start the process
    prog = subprocess.Popen(prog_args, stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE)
    out, err = prog.communicate()

    # deal with error
    if err:
        raise ValueError("Error occurred while calling judger: {}".format(err))

    # return output in json format
    return json.loads(out.decode("utf-8"))
    