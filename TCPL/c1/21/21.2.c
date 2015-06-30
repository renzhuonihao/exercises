#include <stdio.h>
#define TABSTOP 4
#define SPA ' '
int main(void){
  int cur_st=0,spaces;
  int c;

  spaces = 0;
  while((c=getchar()) != EOF){
    if(SPA == c)
      spaces++;
    else{
      if(0 == spaces){
	putchar(c);
	cur_st++;
      }
      else if(1 == spaces){
	putchar(SPA);
	putchar(c);
	spaces=0;
	cur_st+=2;
      }
      else{
	if((spaces+cur_st)/TABSTOP != cur_st/TABSTOP){
	  putchar('\t');
	  while(cur_st/TABSTOP != 0){
	    spaces--;
	    cur_st++;
	  }
	  while(0 != spaces){
	    putchar(SPA);
	    cur_st++;
	    spaces--;
	  }
	}
	else
	  while(0 != spaces){
	    cur_st++;
	    spaces--;
	  }
      }
    }
     if('\n' == c)
	cur_st = 0;
  }
  return 0;
}
