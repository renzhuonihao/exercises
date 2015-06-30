#include <stdio.h>
#include <string.h>
#define MAXLEN 1000
int get_line(char *,int ,FILE *);
void tonewpage(int *);
int main(int argc,char *argv[]){
  int lines,pages;
  FILE *fp;
  char line[MAXLEN];
  char *prog = argv[0];
  lines = pages = 0;
  if(argc == 1){
    fprintf(stderr,"%s needs files",prog);
    return 1;
  }else{
    while(--argc > 0){
      if((fp = fopen(*++argv,"r")) == NULL){
	fprintf(stderr,"%s:can't open %s\n",prog,*argv);
	return 2;
      }else{
	tonewpage(&lines);
	pages++;
	printf("_%d_%d_                *%s*\n",pages,lines,*argv);
	lines++;
	while(get_line(line,MAXLEN,fp) != 0){
	  printf("%d   %s",lines,line);
	  lines++;
	  if((lines % 50) == 49){
	    pages++;
	    printf("_%d_",pages);
	  }
	}
	if(!feof(fp)){
	  printf("%s is not to the end\n",*argv);
	  return 3;
	}
	fclose(fp);
      }
    }
  }
  return 0;
}

void tonewpage(int *lines){
  if(*lines == 0)
    return;
  while((*lines % 50) != 49){
    putchar('\n');
    (*lines)++;
  }
}
int get_line(char *line,int max,FILE *fp){
  if(fgets(line,max,fp) == NULL)
    return 0;
  else
    return strlen(line);
}
