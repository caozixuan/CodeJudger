#include <stdio.h>
#include <string.h>

int main(int argc, char* args[])
{
    fprintf(stderr, "test stderr\n");
    fprintf(stdout, "test stdout\n");
    
    return 0;
}