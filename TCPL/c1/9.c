#include <stdio.h>
int main(void){
  int c,lastc;
  while ((c=getchar()) != EOF){
    if ( c == ' ' && lastc ==' ')
      continue;
    else
      putchar(c);
    lastc = c; 
 }
  return 0;
}
