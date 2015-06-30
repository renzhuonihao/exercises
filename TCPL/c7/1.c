#include <stdio.h>
#include <string.h>
#include <ctype.h>
int main(int argc,char *argv[]){
  int c;
  while((c = getchar()) != EOF){
    if(strcmp(argv[0],"./tl") == 0)
      putchar(tolower(c));
    else if(strcmp(argv[0],"./tu") == 0)
      putchar(toupper(c));
    else
      putchar(c);
  }
  return 0;
}
