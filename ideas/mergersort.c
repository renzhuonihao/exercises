#include <stdio.h>
#include <stdlib.h>
#define MAX 50
void mergesort(int ar[],int left,int right);
void merge(int ar[],int left,int mid,int right);
void copyarr(int fr[],int left,int right,int to[]);
int main(void)
{
	int i,arr[MAX];
	for(i=0;i<MAX;i++)
		arr[i]=rand()%1000;
	mergesort(arr,0,MAX-1);
	for(i=0;i<MAX;i++)
	{
		printf("%5d",arr[i]);
		if(i%7==6)
			putchar('\n');
	}
	putchar('\n');
	return 0;
}
void mergesort(int arr[],int left,int right)
{
	int mid;
	if(left<right)
	{
		mid=(left+right)/2;
		mergesort(arr,left,mid);
		mergesort(arr,mid+1,right);
		merge(arr,left,mid,right);
	}
}
void merge(int arr[],int left,int mid,int right)
{
	int *ptrl,*ptrr,lsize,rsize;
	int lcount,rcount;
	lcount=rcount=0;
	lsize=mid-left+1;
	rsize=right-mid;
	ptrl=(int *)malloc(lsize*sizeof(int));
	ptrr=(int *)malloc(rsize*sizeof(int));
	copyarr(arr,left,mid,ptrl);
	copyarr(arr,mid+1,right,ptrr);
	while(lcount<lsize &&rcount<rsize)
	{
		if(ptrl[lcount]<=ptrr[rcount])
			arr[left++]=ptrl[lcount++];
		else
			arr[left++]=ptrr[rcount++];
	}
	if(lcount==lsize)
		copyarr(ptrr,rcount,rsize-1,arr+left);
	else if(rcount==rsize)
		copyarr(ptrl,lcount,lsize-1,arr+left);
}
void copyarr(int fr[],int left,int right,int to[])
{
	int j=0;
	while(left<=right)
		to[j++]=fr[left++];
}
