#include <stdlib.h>
#include <string.h>

int main(int argc, char* args[])
{

    int size = 50 * 1024 * 1024;
    int* p = (int *)malloc(size);
    if (p == NULL)
    {
        return 1;
    }
    memset(p, 1, size);
    free(p);
    return 0;
}