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

int binary_search(int numbers[], int left, int right, int target_number)
{
    int mid = floor((left+right)/2);
    if(left>right)
    {
        return -1;
    }
    else
    {
        
        if (numbers[mid]==target_number)
        {
            return mid;
        }
        else if (numbers[mid]>target_number)
        {
            /* code */
            return binary_search(numbers,left,mid-1,target_number);
        }
        else {
            return binary_search(numbers, mid+1, right, target_number);
        }
        
        
        
    }

}
int main ()
{

int numbers[6] = {1, 5, 6, 2, 8, 10};
int target_number = 5;
int left=0;
int right = sizeof(numbers)/sizeof(numbers[0]);
selectionSort(numbers,right);

int ans = binary_search(numbers, left, right, target_number);

printf("%d\n", ans);

return EXIT_SUCCESS;
}