#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct
{
    char name[51];
    int salary;
    char department[31];
}EMPLOYEE;

int cmp(const void *a, const void *b)
{
    EMPLOYEE * left = (EMPLOYEE *)a;
    EMPLOYEE * right = (EMPLOYEE *)b;

    if(left -> salary != right -> salary)
    {
        return -(left ->salary -right->salary);
    }
    int dept_cmp = strcmp(left->department, right->department);
    if(dept_cmp!=0)
    {
        return dept_cmp;
        //since this is a comparison for strings, you should not subtract the memory addresses.
        //I rightly created the dept_cmp variable which checks the value returned by strcmp.
        //instead of subracting the memory addresses, I should instead return dept_cmp.
    }
    return(strcmp(left->name, right->name));
}

int main(int argc, char *argv[])
{
    if(argc ==1)
    {
        fprintf(stderr,"There is no input file.\n");
        return 1;
    }
    FILE *file = fopen(argv[1], "r");
    if(!file)
    {
        fprintf(stderr, "The input file cannot be opened.\n");
        return 2;
    }
    char line[91];
    int length = 0;
    EMPLOYEE emp[125];
    while(fgets(line, sizeof(line), file)!= NULL)
    {
        line[strlen(line)-1] = '\0';
        strcpy(emp[length].name, strtok(line, ";"));
        emp[length].salary = atoi(strtok(NULL,";"));
        strcpy(emp[length].department, strtok(NULL,";"));
        length++;
    }

    fclose(file);
    qsort(emp, length, sizeof(EMPLOYEE), cmp);

    if(argc == 2)
    {
        fprintf(stderr, "There is no output file\n");
        return 3;
    }
    file = fopen(argv[2], "w");
    if(!file)
    {
        fprintf(stderr, "The output file cannot be opened\n");
        return 4;
    }
    for(int i = 0; i<length;i++)
    {
        fprintf(file, "%s;%d;%s\n", emp[i].name, emp[i].salary, emp[i].department);
    }

    fclose(file);

    return EXIT_SUCCESS;
}