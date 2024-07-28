#include <stdio.h>
#include <stdlib.h>

// Prints an array
void print_array(int merged[], int length) {
    printf("%d", merged[0]);
    for (int j = 1; j < length; j++) {
        printf(" %d ", merged[j]);
    }
}

// Returns a union of two sets
void set_union(int set1[], int set2[], int length1, int length2) {
    int lengthU = length1 + length2;
    int merged[lengthU];
    int mergedsize=0;


    // Add elements of array 1 to the union
    for (int i = 0; i < length1; i++) {
        merged[mergedsize++] = set1[i];
    }

    // Add elements of set2 to the union if they don't exist

    for (int j=0; j<length2; j++)
    {
        int isPresent = 0;
        for(int k=0; k<mergedsize; k++)
        {
            if(set2[j]==merged[k])
            {
                isPresent = 1;
                break;
            }
        }
        if(!isPresent) // add the element to the union if ispresent is false
        {
            merged[mergedsize++] = set2[j];
        }
        
    }
    
    puts("The Union of set1 and set2");
    print_array(merged, lengthU); // Print the union after duplication
}

void findIntersection(int set1[], int length1, int set2[], int length2) {
    int intersection[ length1 < length2 ? length1 : length2];
    int intersectionsize=0;

    // Add common elements to the intersection array
    for(int i=0; i<length1; i++)
    {
        for(int j=0; j<length2; j++)
        {
            if(set1[i]==set2[j]) //add the element to the array if the element is both in set1 and set2
            {
                intersection[intersectionsize++] = set1[i];
            }
        }
    }
    puts("The intersection of set1 and set2");
    print_array(intersection, intersectionsize);

}

int main() {
    int task;
    int length1, length2;
    int set1[100], set2[100];

    //Get the task number, 1 for union, 2 for intersection

    puts("Enter the task number: (1 or 2)");
    scanf("%d", &task);

    // Get the lengths of the sets

    puts("Enter the length of set1");
    scanf("%d", &length1);

    puts("Enter the length of set2");
    scanf("%d", &length2);

    puts("Enter the elements of set 1");
    for(int i=0; i<length1; i++)
    {
        scanf("%d", &set1[i]);
    }

    puts("Enter the elements of set 2");
    for(int w=0; w<length2; w++)
    {
        scanf("%d", &set2[w]);
    }

    switch(task){
        case 1:
        set_union(set1, length1, set2, length2);
        break;
        case 2:
        findIntersection(set1, length1,set2,length2);
        break;
        default:
        puts("invalid task");
        break;
    }

}
