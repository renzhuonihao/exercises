#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
void itoa(int ,char s[]);
void reverse(char s[]);
int main(void){
  char arr[20];

  printf("INT_MIN: %d\n",INT_MIN);
  itoa(INT_MIN,arr);
  printf("arr : %s\n",arr);

  return 0;
}

void reverse(char s[]){
  int i,j,temp;
  for(i=0,j= strlen(s)-1;i<j;i++,j--){
    temp = s[i];
    s[i] = s[j];
    s[j] = temp;
  }
}

void itoa(int n,char s[]){
  int i,sign;
  sign = n;
  i = 0;
  do{
    s[i++] = abs(n % 10) + '0';
  }while (n/=10);
    if(sign < 0)
      s[i++] = '-';
  s[i] = '\0';
  reverse(s);
}
