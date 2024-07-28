#include<stdio.h>
#include<stdlib.h>


int sum(){
    int i, x;
    x=0;
    for(i=1; i<=100; i++)
    {
        x=x+1; //summation
    }
    return x; // return sum
}
int main ()
{

printf("%d\n", sum()); // print sum
return EXIT_SUCCESS;
}