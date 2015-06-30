#include "cal.h"
#include <stdio.h>
#define STACKSIZE 100
static double stack[STACKSIZE];
static int sp = 0;
void push(double num){
  if(sp >= STACKSIZE)
    printf("error:stack is full\n");
  else
    stack[sp++] = num;
}

double pop(void){
  if(sp <= 0){
    printf("error:stack is empty\n");
    return 0.0;
  }else
    return stack[--sp];
}

