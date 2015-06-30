#include <stdio.h>
int main(void){

  int c,lim,i;
  while(i < lim-1){
    c=getchar();
    if(c == '\n')
      break;
    else if (c == EOF)
      break;
    else //can be omitted,this else,i think
      s[i++] =c;
  }
  return 0;
}
