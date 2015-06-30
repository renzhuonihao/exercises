#include <stdio.h>
#include <string.h>
#define MAX 20
void swap(char s[],int a,int b);
void rec_reverse(char s[],int a,int b);
int main(void){
  char s[MAX];
  while(scanf("%s",s) == 1){
      rec_reverse(s,0,strlen(s)-1);
      printf("%s",s);
  }
    return 0;
}
void rec_reverse(char s[],int a,int b){
  if(a < b){
    swap(s,a,b);
    rec_reverse(s,a+1,b-1);
  }
}

void swap(char s[],int a,int b){
  char temp;
  temp = s[a];
  s[a] = s[b];
  s[b] = temp;
}
