#include <stdio.h>
#include <string.h>
#define MAXLEN 1000
int get_line(char *,int,FILE *);

int main(int argc,char *argv[]){
  FILE *fp1,*fp2;
  char line1[MAXLEN],line2[MAXLEN];
  int signal1,signal2;

  if(argc != 3){
    fprintf(stderr,"%s needs two files\n",argv[0]);
    return -3;
  }else{
    if((fp1 = fopen(argv[1],"r")) == NULL){
      fprintf(stderr,"%s:can't open %s",argv[0],argv[1]);
      return -1;
    }
    if((fp2 = fopen(argv[2],"r")) == NULL){
      fprintf(stderr,"%s:can't open %s\n",argv[0],argv[2]);
      return -2;
    }
    signal1 = get_line(line1,MAXLEN,fp1);
    signal2 = get_line(line2,MAXLEN,fp2);
    while(signal1 != 0 && signal2 != 0){
      if(strcmp(line1,line2) != 0){
	printf(line1);
	printf(line2);
	return 0;
      }
      signal1 = get_line(line1,MAXLEN,fp1);
      signal2 = get_line(line2,MAXLEN,fp2);
    }
    if(!feof(fp1)){
      printf("error:%s not to the end\n",argv[1]);
      return -1;
    }
    if(!feof(fp2)){
      printf("error:%s not to the end\n",argv[2]);
      return -2;
    }
    fclose(fp1);
    fclose(fp2);
    printf("%s and %s is all the same\n",argv[1],argv[2]);
    return 0;
  }
}

int get_line(char *line,int max,FILE *fp){
  if(fgets(line,max,fp) == NULL)
    return 0;
  else
    return strlen(line);
}


/*
  做这个题的时候，突然想到一个问题，将FILE* fp作为形参的函数，被调用的
  时候实际上是用的fp的拷贝，而不是fp本身，那么fp在下次作为参数传递的的
  时候，仍为上次的值？是不是需要把fp设置为静态的？

  不是，我也很奇怪，现在比较好奇FILE是如何实现的了。
*/
