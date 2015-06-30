//这个程序写的很不爽，感觉有问题不知道在什么地方
#include <stdio.h>
#define MAXLINE 1001
int get_line(char s[],int); 
void cutline(char s[],int);
int main(void){
  int len;
  char line[MAXLINE];
  while((len =get_line(line,MAXLINE)) > 0){
    cutline(line,len);
    printf("%s",line);
    //    printf("%s","hello");
  }
  return 0;
}
int get_line(char s[],int lim){
  int c,i;
  for(i=0; i<lim-1 && (c=getchar())!=EOF && c!='\n';++i)
    s[i] = c;
  if ('\n' == c){
    s[i] = c;
    ++i;
  } 
  s[i]='\0';
  return i;
}
void cutline(char s[],int len){
  len--;
  if('\n' == s[len]){
    while(len >= 0 &&
	  (s[len] == '\t' || s[len] == ' ')){
      s[len] = '\0';
      len--;
    }
  }
}
