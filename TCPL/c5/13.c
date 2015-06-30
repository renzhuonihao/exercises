#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#define MAXLINE 100
#define MAXLEN 1000
int isnum(char s[]);
int get_line(char [],int);
char *dupstr(const char []);
void show(int n,char *arr[],int lines);
int main(int argc,char *argv[]){
  int n,i;
  char *arr[MAXLINE];
  char line[MAXLEN];
  i = 0;
  if(argc == 2 && argv[1][0] == '-' && isnum(argv[1]+1))
    n = (int) atof(argv[1]+1);
  else
    n = 10;
  while(get_line(line,MAXLEN) > 0){
    arr[i++] = dupstr(line);
  }
  show(n,arr,i);
}

void show(int n,char *arr[],int lines){
  if(n < 1)
    return;
  if(lines < n)
    n = lines;
  printf("%s",arr[lines-n]);
  if(n > 1)
    show(n-1,arr,lines);
}

char *dupstr(const char s[]){
  char *p = (char *)malloc(strlen(s) + 1);
  if(p)
    strcpy(p,s);
  return p;
}

int isnum(char s[]){
  int i,dot_ct;
  dot_ct =  0;
  for(i = 0;s[i];i++){
    if(isdigit(s[i]))
      continue;
    else if(s[i] == '.')
      dot_ct++;
    else
      return 0;
  }
  if(dot_ct <= 1)
    return 1;
  else
    return 0;
}

int get_line(char s[],int n){
  int c,i;
  for(i = 0;i<n-1 && (c=getchar()) != EOF && c != '\n';++i)
    s[i] = c;
  if(c == '\n'){
    s[i] = c;
    i++;
  }
  s[i] = '\0';
  return i;
}
