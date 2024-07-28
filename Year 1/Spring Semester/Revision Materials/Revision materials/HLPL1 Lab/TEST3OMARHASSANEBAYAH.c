//omar hassan ebayah's test answer number 3
#include<stdio.h>
void readToArray(int *ar,int size);
void getSumAvg(int *ar,int size,int *sum,float *avg);

void readToArray(int *ar,int size){
	printf("Enter 10 integer numbers:\n");
	int i;
	for(i=0;i<size;i++){
		scanf("%d",&ar[i]);
	}
	
}

void getSumAvg(int *ar,int size,int *sum,float *avg){
	int i;
	*sum=0;
	for(i=0;i<size;i++){
		*sum+=ar[i];
	}
	*avg=(float)(*sum)/size;
}

int main(){
	int i;
	int size;
	int arr[10];
	int sum;
	float avg;
	
	readToArray(arr,10);
	getSumAvg(arr,10,&sum,&avg);
	
	
	printf("The sum of the integers:%d\n",sum);
	printf("The average of the integers is:%.2f",avg);
	return 0;
}
