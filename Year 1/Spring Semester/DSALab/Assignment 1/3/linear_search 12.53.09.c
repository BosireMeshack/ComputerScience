#include<stdio.h>
#include<stdlib.h>
#include<math.h>


void swap(int* xp, int* yp) 
{ 
    int temp = *xp; 
    *xp = *yp; 
    *yp = temp; 
}

// Function to perform Selection Sort 
void selectionSort(int arr[], int n) 
{ 
    int i, j, min_idx; 
  
    // One by one move boundary of 
    // unsorted subarray 
    for (i = 0; i < n - 1; i++) { 
        // Find the minimum element in 
        // unsorted array 
        min_idx = i; 
        for (j = i + 1; j < n; j++) 
            if (arr[j] < arr[min_idx]) 
                min_idx = j; 
  
        // Swap the found minimum element 
        // with the first element 
        swap(&arr[min_idx], &arr[i]); 
    } 
} 

int main ()
{

    int counter = 0;
    int numbers[5] = {10, 5, 7, 4 , 12};
    int target_number = 1;
    int numbers_length = sizeof(numbers)/sizeof(numbers[0]);

    selectionSort(numbers, numbers_length);

    

    for(;counter<numbers_length;counter++)
    {
            if(numbers[counter]==target_number)
        {

            printf("The element is in position:%d\n",counter+1);
            
        }
        else {
            
        }
        
    }  

    

return EXIT_SUCCESS;
}