//
// Created by yiner on 2019/4/1.
//

#ifndef JUDGERSANDBOX_LOG_H
#define JUDGERSANDBOX_LOG_H

#include <stdio.h>
#include <sys/file.h>

#define LOG_LEVEL_FATAL 0
#define LOG_LEVEL_WARNING 1
#define LOG_LEVEL_INFO 2
#define LOG_LEVEL_DEBUG 3

FILE *log_open(const char*);

void log_close(FILE *);

void log_write(int level, const char *source_filename, const int line_num, const FILE *log_fp, const char* fmt, ... );

#ifdef JUDGER_DEBUG
#define LOG_DEBUG(log_fp, x...)   log_write(LOG_LEVEL_DEBUG, __FILE__, __LINE__, log_fp, ##x)
#else
#define LOG_DEBUG(log_fp, x...)
#endif

#define LOG_INFO(log_fp, x...)  log_write(LOG_LEVEL_INFO, __FILE__, __LINE__, log_fp, ##x)
#define LOG_WARNING(log_fp, x...) log_write(LOG_LEVEL_WARNING, __FILE__, __LINE__, log_fp, ##x)
#define LOG_FATAL(log_fp, x...)   log_write(LOG_LEVEL_FATAL, __FILE__, __LINE__, log_fp, ##x)



#endif //JUDGERSANDBOX_LOG_H
