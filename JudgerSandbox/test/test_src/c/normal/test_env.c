#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* args[])
{
    printf("%s\n%s\n", getenv("test"), getenv("home"));
    return 0;
}