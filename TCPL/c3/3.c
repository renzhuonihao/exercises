#include <stdio.h>
#include <ctype.h>
#define MAX 1001
void expand(char from[],char to[]);
int issame(int,int);
int main(void){
  char from[MAX],to[MAX];
  scanf("%s",from);                      //发现scanf()真是一个垃圾！
  expand(from,to);
  printf("After the expanding,the string is \n");
  printf("%s\n",to);
  return 0;
}


void expand(char from[],char to[]){       //程序对输入输出做了一定的假设，起手速度快了点
  int prev,next;                        //有种情况没有考虑，即9-0也得扩展，不过对程序稍加修改即可完成
  int temp,j,index;

  index = j = 0;
  prev = EOF;
  while(from[index]){
    next = from[index+1];
    if('-' == from[index] && issame(prev,next)){
	for(temp = prev,j=j-1;temp <= next;temp++)
	  to[j++] = temp;
	index++;
      }
    else
      to[j++] = from[index];
    prev = from[index];
    index++;
  }
  to[j] = '\0';
}

int issame(int prev,int next){
  if(next > prev+1 &&
     (isdigit(prev) && isdigit(next) || islower(prev) && islower(next) ||
      isupper(prev) && isupper(next)))
    return 1;
  else 
    return 0;
}
