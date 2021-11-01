#include "e.h"
// #include <stdio.h>

double ee(double x)
{
    double prev, e, a;
    int n;

    prev = 0; e = 0; a = 1;
    n = 1;
    do{
        prev = e; e += a; a *= x / n; n++;
    }while (prev != e);

    return e;
}

/*
int main(void)
{
    printf("%.10f\n", ee(1));
    return 0;
}
*/