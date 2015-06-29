#include <stdio.h>
#define MAX 50
void insort(int * ,int n);
void showarr(const int *,int n);
int fillarr(int *);
int main(void)
{
	int arr[MAX],num_of_ele;
	num_of_ele=fillarr(arr);
	puts("Original list");
	showarr(arr,num_of_ele);
	insort(arr,num_of_ele);
	puts("Sorted list");
	showarr(arr,num_of_ele);
	puts("Done");
	return  0;
}
int fillarr(int *arr)
{
	int ele;
	int index=0;
	puts("Please enter the integers(and q to quit)");
	while(scanf("%d",&ele)==1 && index<MAX)
	{
		arr[index]=ele;
		index++;
	}
	puts("The arr has been filled.");
	return index;
}
void showarr(const int *arr,int n)
{
	int index;
	for(index=0;index<n;index++)
	{
		printf("%3d",arr[index]);
		putchar('\n');
	}
}
void insort(int *arr,int n)
{
	int indexi,indexo,key;
	for(indexo=1;indexo<n;indexo++)
	{
		key=arr[indexo];
		indexi=indexo-1;
		while(indexi>=0 && arr[indexi]>key)
		{
			arr[indexi+1]=arr[indexi];
			indexi--;
		}
		arr[indexi+1]=key;
	}
}
