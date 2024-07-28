#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>


char* double_digits(char* original) {

    int len= strlen(original);
    char* result = (char*) calloc((len*2)+1, sizeof(char));

    int pos =0;
    for(int i=0;i<len;i++) {

        if(isdigit(original[i]))
        {
            result[pos++] = original[i];
        }
        result[pos++]= original[i];
    }
    result[pos] = '\0';
    return result;
}

int main() {

    char line[100];

    while(1)
    {
        if(strcmp(line,"END")==0) {
            break;
        }
        gets(line);
        char* result = double_digits(line);
        puts(result);
        free(result);
    }


    return EXIT_SUCCESS;
}