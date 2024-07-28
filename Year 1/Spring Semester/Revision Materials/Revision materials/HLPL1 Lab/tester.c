#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct 
{
    char code[6];
    char name[51];
    char theme[31];
    int bricks;
}LEGOS;


int cmp(const void *a, const void *b)//this is the comparator function that describes how to sort the structs
{/*To do this, we need two pointers and this is them initialized here. If you really want to understand the qsort algorithm,
Abdul Bari has a video on qsort algorithm on YT*/
    LEGOS *left = (LEGOS*)a;
    LEGOS * right = (LEGOS *)b;
    if(left -> bricks != right -> bricks)
    {
        return -(left -> bricks - right -> bricks);
    }
    int theme_cmp = strcmp(left ->theme, right->theme);
    //Read on the strcmp() function as well to understand how this function works so that you understand this function. At the bottom though, I will explain how this cmp function generally works.
    if(theme_cmp != 0)
    {
        return theme_cmp;
    }
    int name_cmp = strcmp(left ->name, right->name);
    if(name_cmp != 0)
    {
        return name_cmp;
    }
    return strcmp(left->code, right->code);
}
/*cmp compares two values which it has called left and right, if left - right is a negative value, the magnitude does not matter, we only want to know whether the value is positive or negative
if the value is negative, it means the value of the left is smaller than that on the right and based on this information, the program should rearrange based on whether we want an ascending or descending order
strcmp returns values but just read to understand. I hope this helps! :)*/



int main(int argc, char *argv[])
/*the main function takes two parameters ie argc which is the count of arguments on the command line and 
argv[] which is the array of arguments on the command line*/
{
    if (argc == 1) 
    /*this line checks whether there is an input file, in the event that there is no input file, there would be only one argument on the command line*/
    {
        fprintf(stderr, "There is no input file\n");
        return 1;
    }
    FILE * file = fopen(argv[1], "r"); 
    /*Create a file pointer named file which allows us to access a file. Using this line, we open a file with the aim of reading the file*/
    if(!file)
    //If the file cannot be opened, print an error message to the stderr line (standard error) with a return value of 2.
    {
        fprintf(stderr, "This file cannot be opened.\n");
        return 2;
    }
    char line[102]; 
    /*At this point, we are inside the file that we have opened
    create a character array which has takes 100 characters. However, we give a buffer of two characters because the null
    terminating character is not accounted for, that is for one character and when we use fgets() which we do, it creates a \n chaarcter and we need to 
    replace it with another null terminating character so that is why we need a buffer of two characters*/
    int len = atoi(fgets(line, sizeof(line),file)); 
    /*This is the value that will determine how many lines we are going to read from the file. We use atoi() because line is in 
    character form but then we need len to be an integer.*/
    LEGOS lego[len];
    /*Create a struct called lego based on the struct we have described above which takes in len(a number) structs*/
   for(int i=0; i< len; i++)
   {
    fgets(line, sizeof(line), file);
    /*Read the following len lines and perform the following lines in the for loop*/
    line[strlen(line)-1] = '\0';
    /*Like I have mentioned above, fgets() creates a newline character every time it reads a line so we use this line to 
    replace the \n with a null terminating character otherwise the prgram will never reach the end of the file which is 
    denoted by the null terminating character.*/
    strcpy(lego[i].code, strtok(line, ";"));
    /*code, name, and theme are strings so to get the values from the line after tokenizing, we use the strcpy() function
    strcpy(string you want to copy to, string you want to copy from) <- this is the syntax
    strtok(the string you want to tokenize, delimeter to tokenize by)<- this is the syntax for strtok (short for string tokenize)
    for every subsequent tokenization after the first one, the string to tokenize is NULL but I don't remember the explanation for it*/
    strcpy(lego[i].name, strtok(NULL, ";"));
    strcpy(lego[i].theme, strtok(NULL, ";"));
    lego[i].bricks = atoi(strtok(NULL, ";"));
    //bricks is an integer so you perform type conversion using atoi()
   }


   fclose(file);//after reading the file, you must close it.
   qsort(lego, len, sizeof(LEGOS), cmp); //call the qsort function which sorts the lego structs.
   //qsort(array to be sorted, length of that array, size of the array, comparator)

   if(argc == 2) // this one checks if there is an output file, and if not, it prints an error message. Basically the same thing as above.
   {
    fprintf(stderr, "There is no output file.\n");
    return 3;
   }
   file = fopen(argv[2], "w");
   if(!file)
   {
    fprintf(stderr,"This file cannot be opened");
    return 4;
   }

//once everything is done, print the output to the output file. That is what this last part of the code is doing.
   for(int i=0; i<len;i++)
   {
    fprintf(file, "%s;%s;%s;%d\n", lego[i].code, lego[i].name, lego[i].theme, lego[i].bricks);
   }

   fclose(file);
   //after writing into the file, you have to close it.
   return EXIT_SUCCESS;

}
