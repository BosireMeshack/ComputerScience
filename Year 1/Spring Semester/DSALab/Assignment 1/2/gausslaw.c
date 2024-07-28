#include<stdio.h>
#include<stdlib.h>
int main ()
{

int sum;
int n;

printf("Enter n\n");

scanf("%d", &n);

sum = n*(n+1)/2;

printf("The sum is equal to: %d\n", sum);

return EXIT_SUCCESS;
}