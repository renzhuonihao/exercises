#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include "cal.h"
int main(int argc,char *argv[]){
   char *op[] = {
    "+","-","*","/","%","cos","sin",NULL,
  };
  double op2;
  int j,type;
  int i = 1;
  char c;
  while(argv[i]){
    if(isdigit(c = argv[i][0]) || c =='.'){   //||c == '+' ||c == '-'
      push(atof(argv[i]));
    }else{
      //      printf("%s\n",argv[i]);  加上这条测试语句，出现了非常诡异的结果。
      for(j = 0,type = -1;op[j];j++)
	if(strcmp(argv[i],op[j]) == 0){
	  //printf("%s  %s\n",argv[i],op[j]);
	  type = j;
	}
      //printf("type = %d\n",type);
      switch(type){
      case 0:
	push(pop() + pop());
	break;
      case 1:
	op2 = pop();
	push(pop() - op2);
	break;
      case 2:
	push(pop() * pop());
	break;
      case 3:
	op2 = pop();
	if(op2 != 0.0)
	  push(op2 / pop());
	else
	  printf("error:zero divisor\n");
	break;
      case 4:
	op2 = pop();
	if(op2 != 0.0)
	  push(fmod(pop(),op2));
	else
	  printf("error: zero divisor\n");
	break;
      case 5:
	push(cos(pop()));
	break;
      case 6:
	push(sin(pop()));
	break;
      default:
	printf("error:unknow command\n");
	break;
      }
    }
    i++;
  }
  printf("The answer is %f\n",pop());
  return 0;
}
