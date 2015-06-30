#include <stdio.h>
#define MAXLINE 1001
void reverse(char s[]);
void discard_n(char s[]){
  int i;
  for(i=0;s[i] != '\0';i++){
    if(s[i] == '\n')
      s[i] = '\0';
  }
}
int get_line(char s[],int);
int main(void){
  int len;
  char line[MAXLINE];
  while((len = get_line(line,MAXLINE)) > 0){
    discard_n(line);
    reverse(line);
    printf("%s",line);
  }
  return 0;
}

void reverse(char s[]){
  int i,j;
  char temp;
  for(j=0;s[j] != '\0';j++);
  for(i=0,j=j-1;i < j;i++,j--){
    temp = s[i];
    s[i] = s[j];
    s[j] = temp;
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
