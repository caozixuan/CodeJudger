#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char* args[])
{
    printf("uid: %d\ngid: %d\n", getuid(), getgid());
    system("/usr/bin/id");
    return 0;
}