//omar hassan ebayah's test answer number 2
#include<stdio.h>
int main(){
	FILE *fileptr=fopen("text.txt","r");
	char c;
	int capital=0,noncapital=0;
	
	do{
		c=fgetc(fileptr);
		if(c>='a'&&c<='z'){
			noncapital++;
		}
		if(c>='A'&&c<='Z'){
			capital++;
		}
	}
	while(c!=EOF);
	printf("Number of Capital Letters:%d\nNumber of Non-Capital letters:%d",capital,noncapital);
	fclose(fileptr);
	return 0;
}
