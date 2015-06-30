#include <stdio.h>
#define MAXLINE 1001
#define WST 5
void show(char s[]);
int get_line(char s[],int lim);
int main(void){
  int len;
  char line[MAXLINE];

  while((len=get_line(line,MAXLINE)) > 0){
    show(line);
  }
  return 0;
}

void show(char s[]){
  int i,j,c_c;
  i=c_c=0;

  while(s[i] != '\0'){
    if(s[i] != '\t'){
      putchar(s[i]);
      c_c++;
    }
    else{
      for(j=0;j < (WST-c_c%WST);j++)
	putchar(' ');
      c_c=0;
    } 
   i++;
  }
}

int get_line(char s[],int lim){
  int c,i;
  for(i=0;i<lim-1 && (c=getchar())!=EOF && c!='\n';i++)
    s[i] = c;
  if(c == '\n'){
    s[i] = c;
    ++i;
  }
  s[i] = '\0';
  return i;
}
