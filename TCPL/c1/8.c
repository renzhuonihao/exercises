#include <stdio.h>
int main(void){
  int c,ns,nt,nl;
  ns=nt=nl=0;
  while((c = getchar()) != EOF)
    {
    if (c ==' ')
      ns++;
    if (c == '\t')
      nt++;
    if (c == '\n')
      nl++;
    } 
  printf("ns is %d,nt is %d,nl is %d.\n",ns,nt,nl);
  return 0;
}
