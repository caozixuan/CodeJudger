#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* args[])
{
    FILE *f = fopen("/tmp/output_size_test", "w");
    if (f == NULL)
    {
        return 1;
    }
    for (int i = 0; i < 100000; ++i)
    {
        if (fprintf(f, "%s", "1111111111111111111111111111111111111111")<=0)
        {
            fclose(f);
            return 2;
        }
    }
    fclose(f);
    
    return 0;
}