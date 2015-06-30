#include <stdio.h>
int main(int argc,char *argv[]){
  int i,c;
  FILE *fp;
  if(argc > 1){
    for(i = 1;i < argc;i++){
      if((fp = fopen(argv[i],"r")) == NULL){
	printf("error:can't find file %s\n",argv[i]);
	continue;
      }else{
	while((c = getc(fp)) != EOF)
	  putchar(c);
	fclose(fp);
      }
    }
  }else{
    while((c = getchar()) != EOF)
      putchar(c);
  }
  return 0;
}
