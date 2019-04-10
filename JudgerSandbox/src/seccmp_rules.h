//
// Created by yiner on 2019/4/4.
//

#ifndef JUDGERSANDBOX_SECCMP_RULES_H
#define JUDGERSANDBOX_SECCMP_RULES_H

#include <stdbool.h>
#include "run.h"

int set_seccmp_rules(struct config *);
int _set_seccmp_rules(struct config *, bool allowWrite);
int set_seccmp_rules_io(struct config *_config);



#endif //JUDGERSANDBOX_SECCMP_RULES_H
