#include <stdio.h>
#include <string.h>
#define MAXLINE 1000
int get_line(char *line,int max);
int main(int argc,char *argv[]){
  char line[MAXLINE];
  char *pattern;
  int i,j,line_mode,match_mode,l_ct;
  line_mode = 0;
  match_mode = 1;
  l_ct = 0;
  for(i = 1;i < argc;i++){
    if(argv[i][0] == '-'){
      for(j = 0;argv[i][j];j++){
	if(argv[i][j] == 'n')
	  line_mode = 1;
	if(argv[i][j] == 'x')
	  match_mode = 0;
      }
    }else{
      pattern = argv[i];
    }
  }
 printf("%s  %d  %d\n",pattern,match_mode,line_mode);
 while(get_line(line,MAXLINE) > 0){
    if(strstr(line,pattern) != NULL && match_mode || strstr(line,pattern) == NULL && !match_mode){
      if(line_mode)
	printf("%d: ",l_ct++);
      printf("%s",line);
    }
  }
  return l_ct;
}

int get_line(char *s,int lim){
  int c,i;
  for(i = 0;i<lim-1 && (c=getchar()) != EOF && c != '\n';i++)
    s[i] = c;
  if(c == '\n'){
    s[i] = c;
    i++;
  }
  s[i] = '\0';
  return i;
} 
//这个程序真是诡异，不知道为什么出现了个段错误
//已经解决，发现是因为get_line()函数没有写，出现了段错误，这gcc编译器真是坑爹，没有定义编译出来一点警告都没有
