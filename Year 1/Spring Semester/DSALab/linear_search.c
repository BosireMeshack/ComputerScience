#include<stdio.h>
#include<stdlib.h>

int linear_search(int arr[], int key, int length){

    for(int i=0; i<length; i++) {
        if(arr[i] == key)
        {
            return i;
            
        }
    }
    return -1;
}


int main ()
{
    int arr[10] = {2, 6, 7, 11, 7, 34, 6, 8, 10, 17};

    int key = 1;

    int len = sizeof(arr)/sizeof(arr[0]);
    
    int result = linear_search(arr, key,len);

    // Print the result
    if (result != -1) {
        printf("Element %d found at position %d\n", key, result + 1);
    } else {
        printf("Element %d not found\n", key);
    }

return EXIT_SUCCESS;
}