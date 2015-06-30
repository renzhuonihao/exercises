#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
void itoa(int ,char s[],int wide);
void reverse(char s[]);
int main(void){
  char s[20];
  int num,wide;
  printf("please enter the num and width.\n");
  while(scanf("%d %d",&num,&wide) == 2){
      itoa(num,s,wide);
      printf("123456789\n");
      printf("%s\n",s);
      printf("please enter the num and width.\n");
    }
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

void itoa(int n,char s[],int wide){
  int i,sign;
  sign = n;
  i = 0;
  do{
    s[i++] = abs(n % 10) + '0';
  }while (n/=10);
    if(sign < 0)
      s[i++] = '-';
    for(i;i<wide;i++)
      s[i] = ' ';
  s[i] = '\0';
  reverse(s);
}
