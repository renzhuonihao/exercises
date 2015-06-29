#include <stdio.h>
#include <time.h>
#include <stdlib.h>
int array[100];
void showstar(int n)
{
	while(n-->0)
		putchar('*');
	printf("\ttime is %d",(int)time(0));
	putchar('\n');
}
void merge(int arr[],int left,int mid,int right)
{
	int i,j,k;
	i=left;
	j=mid+1;
	k=0;
	while(i<=mid && j<=right)
	{
		if(arr[i]<=arr[j])
			array[k++]=arr[i++];
		else
			array[k++]=arr[j++];
	}
	if(j<=right)
		for(;j<=right;)
			array[k++]=arr[j++];
	if(i<=mid)
		for(;i<=mid;)
			array[k++]=arr[i++];
	for(k=0;left<=right;)
		arr[left++]=array[k++];
	//showstar(k);
for(i=0;i<k;i++)
printf("%3d",array[i]);
printf("\n");
}
void mergesort(int arr[],int left,int right)
{
	if(left<right)
	{
	        int mid=left+(right-left)/2;
		mergesort(arr,left,mid);
		mergesort(arr,mid+1,right);
		merge(arr,left,mid,right);
	}
}
int main(void)
{
	int arr[10];
	int j,i;
	for(i=0;i<10;i++)
		arr[i]=rand()%30;
	mergesort(arr,0,9);
/*	for(i=0;i<20;i++)
	{
		printf("%5d",arr[i]);
		if(i%5==4)
			putchar('\n');
	}
	int sorted=1;
	for(i=0,j=1;j<20;)
	{
		if(arr[i++]<=arr[j++])
			continue;
		else
		{
			sorted=0;
			break;
		}
	}
	if(sorted)
		printf("sorted\n");
	else
		printf("unsorted;\n"); 
 */
	return 0;
}
