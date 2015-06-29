#include <stdio.h>
#include <stdlib.h>
#define ARR_MAX 42
#define NUM_MAX 500
void showarr(int arr[],int n);
int partition(int arr[],int p,int q);
void quicksort(int arr[],int p,int q);
void exchange(int arr[],int p,int q);
int main(void)
{
	int i,arr[ARR_MAX];
	for(i=0;i<ARR_MAX;i++)
		arr[i]=rand()%NUM_MAX;
	quicksort(arr,0,ARR_MAX-1);
	showarr(arr,ARR_MAX);
	return 0;
}
void quicksort(int arr[],int p,int q)
{
	int r;
	if(p<q)
	{
		r=partition(arr,p,q);
		quicksort(arr,p,r-1);
		quicksort(arr,r+1,q);
	}
}
int partition(int arr[],int p,int q)
{
	int key=arr[p];
	int i,j;
	for(i=p,j=p+1;j<=q;j++)
	{
		if(arr[j]<=key)
		{
			i++;
			exchange(arr,i,j);
		}
	}
	exchange(arr,p,i);
	return i;
}
void exchange(int arr[],int p,int q)
{
	int temp;
	temp=arr[p];
	arr[p]=arr[q];
	arr[q]=temp;
}
void showarr(int arr[],int n)
{
	int i;
	for(i=0;i<n;i++)
	{
		printf("%4d",arr[i]);
		if(i%5==4)
			putchar('\n');
	}
	if(i%5!=0)
		putchar('\n');
}
