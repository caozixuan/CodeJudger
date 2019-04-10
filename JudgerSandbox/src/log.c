//
// Created by yiner on 2019/4/1.
//

#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <stdarg.h>
#include "log.h"

#define LOG_BUFFER_SIZE 8192

FILE *log_open(const char* filename) {
    FILE *log_fp = fopen(filename, "a");
    if (log_fp == NULL) {
        fprintf(stderr, "can not open log file %s", filename);
    }
    return log_fp;
}

void log_close(FILE * log_fp) {
    if (log_fp != NULL) fclose(log_fp);
}

// fmt: format
void log_write(int level, const char *source_filename, const int line_num, const FILE *log_fp, const char* fmt, ... ) {
    if (log_fp == NULL) {
        fprintf(stderr, "can not open log file");
        return;
    }

    char LOG_LEVEL_NOTE[][10] = {"FATAL", "WARNING", "INFO", "DEBUG"};

    static char buffer[LOG_BUFFER_SIZE];
    static char log_buffer[LOG_BUFFER_SIZE];

    static char line_str[20];

    // get datetime
    static char datetime[100];
    static time_t now;
    now = time(NULL);
    strftime(datetime, 99, "%Y-%m-%d %H:%M:%S", localtime(&now));

    snprintf(line_str, 19, "%d", line_num); // format line_num and copy to line_str

    // get log string and copy it to log_buffer
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(log_buffer, LOG_BUFFER_SIZE, fmt, ap); // format log string  and copy to log_buffer
    va_end(ap);

    // Format log string and copy to buffer.
    // Count represents successfully written bytes.
    int count = snprintf(buffer, LOG_BUFFER_SIZE, "%s [%s] [%s:%s]%s\n",
                         LOG_LEVEL_NOTE[level], datetime, source_filename, line_str, log_buffer);

    // write to log file
    int log_fd = fileno((FILE *)log_fp);
    if (flock(log_fd, LOCK_EX) == 0) {  // lock when write
        if (write(log_fd, buffer, (size_t) count) < 0) {
            fprintf(stderr, "write error");
            return; // Flock will be automatically released as the process is closed.
        }

        flock(log_fd, LOCK_UN); // release flock
    }
    else {
        fprintf(stderr, "flock error");
        return;
    }


}
