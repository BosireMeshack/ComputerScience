#include<stdio.h>
#include<stdlib.h>

int sum(int n) {
    return n*(n+1)/2;
}

int main ()
{
    printf("%d\n", sum(100));
return EXIT_SUCCESS;
}