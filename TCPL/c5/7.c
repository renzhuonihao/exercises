#include <stdio.h>
#include <string.h>
#define MAXLEN 1000
#define BUFSIZE 100000
#define MAXLINES 100
char *lineptr[MAXLINES];
int getline(char *,int);
int readlines(char *lineptr[],int lines,char buf[]);
int main(void){
  char buf[BUFSIZE];
  int nlines;
  if((nlines = readlines(lineptr,MAXLINES,buf)) >= 0)
    ;
  return 0;
}

int readlines(char *lineptr[],int maxlines,char buf[BUFSIZE]){
  int len,nlines;
  char *p,line[MAXLEN];
  nlines = 0;
  p = buf;
  while((len = getline(line,MAXLEN)) > 0)
    if(nlines >= maxlines || p + len + 2 > buf + BUFSIZE)
      return -1;
    else{
      line[len-1] = '\0';
      strcpy(p,line);
      lineptr[nlines++] = p;
      p += (len + 2);
    }
  return nlines;
}
