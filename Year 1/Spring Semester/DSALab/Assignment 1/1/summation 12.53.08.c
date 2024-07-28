#include<stdio.h>
#include<stdlib.h>

int counter = 0; 
int sum = 0;
int numbersCount;

int main(){

   printf("How many numbers do you want to increment? \n"); 
   scanf("%d", &numbersCount);
    // while(counter<=numbersCount)
    // {
    //     sum = sum + counter;
        
    //     counter++;
    // }

    for( ;counter<= numbersCount; counter++)
    {
        sum = sum + counter;

    }
   
    printf("The sum is equal to: %d \n", sum);
}

