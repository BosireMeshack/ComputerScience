#include<stdio.h>
#include<stdlib.h>


int count_of_local_maximums(int *numbers, int length) {

    int count_maximums=0;

    for(int k=1;k<length-1;k++) {

        if((numbers[k]>numbers[k-1]) && (numbers[k]>numbers[k+1]) )
        {
            count_maximums++;
        }
        
    }
    return count_maximums;
}

int main()
{

int n;
int length;

scanf("%d", &n);
for(int i=0; i<n;i++)
{
    scanf("%d", &length);
    
        int numbers[length];
    for(int j=0;j <length; j++)
    {
        scanf("%d", &numbers[j]);
    }
    printf("%d\n", count_of_local_maximums(numbers, length));

    
    
}

    return EXIT_SUCCESS;
}