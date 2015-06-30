#include <stdio.h>
#define IN 1
#define OUT 0
int main(void){
  int c,state;
  state = OUT;
  while ((c=getchar()) != EOF){
    if (c != '\t' && c != ' ' && c != '\n'){
      state = IN;
      putchar(c);
    }
    else if (state == IN){
      putchar('\n');
      state = OUT;
    }
  }
  return 0;
}
