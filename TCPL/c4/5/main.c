#include <stdio.h>
#include <stdlib.h>     //for atof()
#define MAXOP 100     //max size of op
#include <math.h>
#include "calc.h"


/*reverse Polish calculator*/
int main(void){
  int type;
  double op2;
  char s[MAXOP];
  while((type = getop(s)) != EOF){
    // printf("type=%d  %d %d",type,IDENTIFER,NUMBER);
    switch(type){
    case NUMBER:
      push(atof(s));
      break;
    case '+':
      push(pop() + pop());
      break;
    case '*':
      push(pop() * pop());
      break;
    case '-':
      op2 = pop();
      push(pop() - op2);
      break;
    case '/':
      op2 = pop();
      if(op2 != 0.0)
	push(pop() / op2);
      else
	printf("error:zero divisor\n");
      break;
     case '%':
	op2 = pop();
	push(fmod(pop(),op2));
	break;
    case IDENTIFER:
      switch(jfun(s)){
      case 's':
	push(sin(pop()));
	break;
      case 'p':
	op2 = pop();
	push(pow(pop(),op2));
	break;
      case 'e':
	push(exp(pop()));
	break;
       default:
	printf("error:unknown operand:%s\n",s);
	break;
      }
      break;
    case '\n':
      printf("\t%.8g\n",pop());
      break;
    default:
      printf("error: unknown command %s\n",s);
      break;
    }
  }
  return 0;
}
