#include "argtable3.h"
#include "run.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

#define PROM_NAME "judgerSandbox.so"
#define VERSION 0x000100 // (ver >> 16) & 0xff, (ver >> 8) & 0xff, ver & 0xff  -> real version
#define LOG_PATH "judgerSandbox.log"

#define INT_PLACE_HOLDER "<n>"
#define STR_PLACE_HOLDER "<str>"

#define BUFFER_SIZE 500

/* global arg_xxx structs */
struct arg_lit *verb, *help, *version;
struct arg_int *max_cpu_time, *max_real_time, *max_memory, *max_stack, *max_process_num,
        *max_output_size, *uid, *gid;
struct arg_str *exe_path, *input_path, *output_path, *error_path, *args, *env, *log_path, *seccomp_rules;
struct arg_end *end;

void init_config(struct config * _config){
    if (max_cpu_time->count > 0) {
        _config->max_cpu_time = *max_cpu_time->ival;
    } else {
        _config->max_cpu_time = UNLIMITED;
    }

    if (max_real_time->count > 0) {
        _config->max_real_time = *max_real_time->ival;
    } else {
        _config->max_real_time = UNLIMITED;
    }

    if (max_memory->count > 0) {
        _config->max_memory = (long) *max_memory->ival;
    } else {
        _config->max_memory = UNLIMITED;
    }

    if (max_stack->count > 0) {
        _config->max_stack = (long) *max_stack->ival;
    } else {
        _config->max_stack = 16 * 1024 * 1024;  // 16M
    }

    if (max_process_num->count > 0) {
        _config->max_process_num= *max_process_num->ival;
    } else {
        _config->max_process_num = UNLIMITED;
    }

    if (max_output_size->count > 0) {
        _config->max_output_size = (long) *max_output_size->ival;
    } else {
        _config->max_output_size = UNLIMITED;
    }

    _config->exe_path = (char *)*exe_path->sval;

    if (input_path->count > 0) {
        _config->input_path = (char *)input_path->sval[0];
    } else {
        _config->input_path = "/dev/stdin";
    }
    if (output_path->count > 0) {
        _config->output_path = (char *)output_path->sval[0];
    } else {
        _config->output_path = "/dev/stdout";
    }
    if (error_path->count > 0) {
        _config->error_path = (char *)error_path->sval[0];
    } else {
        _config->error_path = "/dev/stderr";
    }

    // config command line arguments
    _config->args[0] = _config->exe_path;
    int i = 1;
    if (args->count > 0) {
        for (; i < args->count + 1; i++) {
            _config->args[i] = (char *)args->sval[i - 1];
        }
    }
    _config->args[i] = NULL;

    i = 0;
    if (env->count > 0) {
        for (; i < env->count; i++) {
            _config->env[i] = (char *)env->sval[i];
        }
    }
    _config->env[i] = NULL;

    if (log_path->count > 0) {
        _config->log_path = (char *)log_path->sval[0];
    } else {
        _config->log_path = LOG_PATH;
    }

    if (seccomp_rules->count > 0) {
        _config->seccomp_rules = (char *)seccomp_rules->sval[0];
    } else {
        _config->seccomp_rules = NULL;
    }

    if (uid->count > 0) {
        _config->uid = (uid_t)*(uid->ival);
    }
    else {
        _config->uid = 65534;
    }
    if(gid->count > 0) {
        _config->gid = (gid_t)*(gid->ival);
    }
    else {
        _config->gid = 65534;
    }

}

int main(int argc, char *argv[]){

    /* init argtable */
    void *argtable[] = {
            help = arg_litn(NULL, "help", 0, 1, "Display This Help And Exit"),
            version = arg_litn(NULL, "version", 0, 1, "Display Version Info And Exit"),

            max_cpu_time = arg_intn(NULL, "max_cpu_time", INT_PLACE_HOLDER, 0, 1, "Max CPU Time (ms)"),
            max_real_time = arg_intn(NULL, "max_real_time", INT_PLACE_HOLDER, 0, 1, "Max Real Time (ms)"),
            max_memory = arg_intn(NULL, "max_memory", INT_PLACE_HOLDER, 0, 1, "Max Memory (byte)"),
            max_stack = arg_intn(NULL, "max_stack", INT_PLACE_HOLDER, 0, 1, "Max Stack (byte, default 16M)"),
            max_process_num = arg_intn(NULL, "max_process_number", INT_PLACE_HOLDER, 0, 1, "Max Process Number"),
            max_output_size = arg_intn(NULL, "max_output_size", INT_PLACE_HOLDER, 0, 1, "Max Output Size (byte)"),

            exe_path = arg_str1(NULL, "exe_path", STR_PLACE_HOLDER, "Exe Path"),
            input_path = arg_strn(NULL, "input_path", STR_PLACE_HOLDER, 0, 1, "Input Path"),
            output_path = arg_strn(NULL, "output_path", STR_PLACE_HOLDER, 0, 1, "Output Path"),
            error_path = arg_strn(NULL, "error_path", STR_PLACE_HOLDER, 0, 1, "Error Path"),

            args = arg_strn(NULL, "args", STR_PLACE_HOLDER, 0, 255, "Arg"),
            env = arg_strn(NULL, "env", STR_PLACE_HOLDER, 0, 255, "Env"),

            log_path = arg_strn(NULL, "log_path", STR_PLACE_HOLDER, 0, 1, "Log Path"),
            seccomp_rules = arg_strn(NULL, "seccomp_rules", STR_PLACE_HOLDER, 0, 1, "Seccomp Rule Name"),

            uid = arg_intn(NULL, "uid", INT_PLACE_HOLDER, 0, 1, "UID (default 65534)"),
            gid = arg_intn(NULL, "gid", INT_PLACE_HOLDER, 0, 1, "GID (default 65534)"),

            end = arg_end(10),
    };

    int exitcode = 0;
    char progname[] = PROM_NAME;


    int nerrors;
    nerrors = arg_parse(argc,argv,argtable);

    /* special case: '--help' takes precedence over error reporting */
    if (help->count > 0)
    {
        printf("Usage: %s", progname);
        arg_print_syntax(stdout, argtable, "\n");
        arg_print_glossary(stdout, argtable, "  %-25s %s\n");
        goto exit;
    }

    if (version->count > 0) {
        printf("Version: %d.%d.%d\n", (VERSION >> 16) & 0xff, (VERSION >> 8) & 0xff, VERSION & 0xff);
        goto exit;
    }

    /* If the parser returned any errors then display them and exit */
    if (nerrors > 0)
    {
        /* Display the error details contained in the arg_end struct.*/
        arg_print_errors(stdout, end, progname);
        printf("Try '%s --help' for more information.\n", progname);
        exitcode = 1;
        goto exit;
    }

    struct config _config;
    struct result _result;

    init_config(&_config);

    run(&_config, &_result);

    printf("{\n"
           "    \"cpu_time\": %d,\n"
           "    \"real_time\": %d,\n"
           "    \"memory\": %ld,\n"
           "    \"signal\": %d,\n"
           "    \"exit_code\": %d,\n"
           "    \"error\": %d,\n"
           "    \"result\": %d\n"
           "}\n",
           _result.cpu_time,
           _result.real_time,
           _result.memory,
           _result.signal,
           _result.exitcode,
           _result.error,
           _result.result);

    static char buffer[500];
    int count = snprintf(buffer, BUFFER_SIZE,
                       "{\n"
                       "    \"cpu_time\": %d,\n"
                       "    \"real_time\": %d,\n"
                       "    \"memory\": %ld,\n"
                       "    \"signal\": %d,\n"
                       "    \"exit_code\": %d,\n"
                       "    \"error\": %d,\n"
                       "    \"result\": %d\n"
                       "}\n",
                       _result.cpu_time,
                       _result.real_time,
                       _result.memory,
                       _result.signal,
                       _result.exitcode,
                       _result.error,
                       _result.result );


    // write result to json file
    int fd;

    if ((fd = open("result.json", O_CREAT|O_WRONLY|O_TRUNC, S_IRWXU|S_ISUID|S_ISGID)) < 0) {
        fprintf(stderr, "open error\n");
        exitcode = 1;
        goto exit;
    }

    if (write(fd, buffer, (size_t) count) < 0) {
            fprintf(stderr, "write error\n");
            exitcode = 1;
            goto exit; 
        }

    exit:
    /* deallocate each non-null entry in argtable[] */
    arg_freetable(argtable, sizeof(argtable) / sizeof(argtable[0]));
    return exitcode;
}