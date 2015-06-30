#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
void itob(int ,char s[],int);
void reverse(char s[]);
int mod(int,int);

int main(void){
  int num,div;
  char s[20];
  printf("please enter the num and div:\n");
  scanf("%d",&num);
  scanf("%d",&div);
  itob(num,s,div);
  printf("%d in base %d is %s.\n",num,div,s);
  return 0;
}
int mod(int num,int div){
  int temp = abs(num % div);
  return (temp >= 10) ? 'a'+temp-10:'0'+temp;
}

void itob(int num,char s[],int div){
  int i,sign;
  sign = num;
  i = 0;
  do{
    s[i++] = mod(num,div);
  }while(num /= div);
  if(sign < 0)
    s[i++] = '-';
  s[i] = '\0';
  reverse(s);
}
void reverse(char s[]){
  int i,j,temp;
  for(i=0,j= strlen(s)-1;i<j;i++,j--){
    temp = s[i];
    s[i] = s[j];
    s[j] = temp;
  }
}
