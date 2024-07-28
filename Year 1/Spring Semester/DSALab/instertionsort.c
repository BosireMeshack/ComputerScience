#include<stdio.h>
#include<stdlib.h>

void insertion_sort(int *arr, int length) {

    for(int i=1; i<length; i++)
    {
        int current = arr[i];
        int j=i-1;

        while(j>=0&& arr[j]>current)
        {
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = current;
    }

    for(int i=0; i<6; i++)
    {
        printf("%d,", arr[i]);
    }

}


int main ()
{
    int arr[] = {2,3,47,1,-2,5};
    insertion_sort(arr, 6);
    

return EXIT_SUCCESS;
}