#include <stdio.h>
#include <signal.h>

int main(int argc, char* args[])
{
    raise(SIGSEGV);  // abort
    return 0;
}