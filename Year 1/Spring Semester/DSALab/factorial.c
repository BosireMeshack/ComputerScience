#include<stdio.h>
#include<stdlib.h>

int factorial(int n)
{
    int factorial = 1;
    for(int i=2; i<=n; i++)
    {
        factorial*=i;
    }
    return factorial;
}



int main ()
{

printf("%d", factorial(5));

return EXIT_SUCCESS;
}