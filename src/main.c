#include <stdio.h>

#include "main.h"

#ifdef HAVE_CONFIG_H
    #include "config.h"
#endif

int main(void)
{
#ifdef HAVE_CONFIG_H
    printf("PACKAGE_STRING=%s\n", PACKAGE_STRING);
#else
    printf("No PACKAGE_STRING available\n");
#endif

    return 0;
}

