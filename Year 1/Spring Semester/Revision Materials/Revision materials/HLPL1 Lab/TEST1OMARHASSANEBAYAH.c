//omar hassan ebayah's test answers
#include<stdio.h>
int main(){
	int arr[10];
	int inp,i;
	
	printf("Enter an integer number:");
	scanf("%d",&inp);
	
	arr[0]=inp;
	for(i=1;i<10;i++){
		arr[i]=arr[i-1]+3;
	}	
	

	for(i=0;i<10;i++){
	printf("%d ",arr[i]);
	}
	return 0;
}
