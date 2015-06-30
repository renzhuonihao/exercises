#include <stdio.h>

int binsearch(int x,int v[],int n){
  int low, high, mid;

  low = 0;
  high = n-1;
  while(low < high){
    mid = (high + low)/2;
    if(x <= v[mid])
       high = mid;
    else
      low = mid + 1;
    printf("%d.\n",v[low]);
  }
  return (v[low] == x) ? low : -1;
}

int main(void){

  int test[]={1,3,5,7,9,11,13};
  int i;
  i = sizeof(test)/sizeof(int);
  printf("try to find %d.index = %d.\n",3,binsearch(3,test,i));
  return 0;
}
