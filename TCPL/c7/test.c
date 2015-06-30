#include <stdio.h>
int main(int argc,char *argv[]){
  FILE *fp;
  char line[1000];
  fp = fopen(argv[1],"r");
  while(fgets(line,1000,fp) != NULL)
    printf("%s",line);
  return 0;
}
