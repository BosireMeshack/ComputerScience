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

int numbers[6] = {1, 5, 6, 2, 8, 10};
int target_number = 5;
int left=0;

int right = sizeof(numbers)/sizeof(numbers[0]);
selectionSort(numbers,right);

// for(int i = 0; i<right; i++)
// {
//     printf("%d ", numbers[i]);
// }

int mid;

while (left<=right)
{
    /* code */
    mid = floor((left+right)/2);
    

    if (numbers[mid]==target_number)
    {
        /* code */
        printf("The target number is at index %d\n", mid);
        return 0;
    }
    if (numbers[mid]>target_number)
    {
        /* code */
        right = mid-1;
    }
    else
    {
        left = mid + 1;
    }
    
    
}




return EXIT_SUCCESS;
}