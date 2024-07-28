#include<stdio.h>
#include<stdlib.h>








int main ()
{


int rows1; int col1; int rows2; int col2; int sum=0;
//Inputing the number of rows and columns for matrix 1

puts("Enter the number of rows and columns of the first matrix");
scanf("%d %d", &rows1, &col1);


puts("Enter the number of rows and columns of the second matrix");
scanf("%d %d", &rows2, &col2);

int mat1[rows1][col1];
int mat2[rows2][col2];
int result[2][2];




// inputing values of the first matrix

for(int i=0; i<rows1; i++)
{
    for(int j=0; j<col1; j++)
    {
        printf("Enter the values of the first matrix %d %d\n", i, j);
        scanf("%d", &mat1[i][j]);
    }
}
//inputing values of the second matrix

for(int k=0; k<rows2; k++)
{
    for(int l=0; l<col2; l++)
    {
        printf("Enter the values of the second matrix %d %d\n", k, l);
        scanf("%d", &mat2[k][l]);
    }
}

//Multiplying the two matrices

if(col1 == rows2)
{
for(int i =0; i<2;i++)
{
    for(int j=0; j<2; j++)
    {
        for(int k=0; k<2; k++)
        {
            result[i][j] = sum+mat1[i][k] * mat2[k][j];
        }
         printf("%d ", result[i][j]);
        
    }
    printf("\n");
}


}
else {
    puts("The matrices are immutable");
}

// print the result matrix



    



return EXIT_SUCCESS;
}