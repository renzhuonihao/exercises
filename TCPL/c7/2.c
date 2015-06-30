#include <stdio.h>
#include <ctype.h>
#include <string.h>
int main(int argc,char *argv[]){
  int count,c;
  count = 0;
  while((c = getchar()) != EOF){
    if(isprint(c))
      putchar(c);
    else{
      if(strcmp(argv[1],"-x") == 0 || strcmp(argv[1],"-X") == 0)
	 printf("%x",c);
      else
	printf("%o",c);
    }
    count++;
    if(count%60 != 0)
      putchar('\n');
  }
  return 0;
}
