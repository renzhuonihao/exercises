#include <stdio.h>
#define MAXVAL 100  //max depth of val stack 
#include "calc.h"
static int sp = 0;         //next free stack position
static double val[MAXVAL];   //value stack

void push(double f){
  if(sp < MAXVAL)
    val[sp++] = f;
  else
    printf("error: stack is full,can't push %g\n",f);
}

double pop(void){
  if(sp > 0)
    return val[--sp];
  else{
    printf("error:stack empty\n");
    return 0.0;
  }
}

int showtop(void){
  if(sp){  
    printf("The top ele of the stack is %f\n",val[sp-1]);
    return 1;
  }
  else{
    printf("error:the stack is empty.\n");
    return 0;
  }
}

int copytop(double to){
  if(sp){
    to = val[sp-1];
    return 1;
  }
  else{
    printf("error:the stack is empty\n");
    return 0;
  }
}

int exchange(void){
  double temp;
  if(sp > 1){
    temp = val[sp-1];
    val[sp-1] = val[sp-2];
    val[sp-2] = temp;
    return 1;
  }
  else{
    printf("error:eles is less than 2.\n");
    return 0;
  }
}

void clean(void){
  sp = 0;
}
