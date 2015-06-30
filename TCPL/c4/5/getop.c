#include <stdio.h>
#include <ctype.h>
#define BUFSIZE 100
#include "calc.h"
static char buf[BUFSIZE];
static int bufp = 0;

static int getch(void);
static void ungetch(int);

int getop(char s[]){
  int i,c;

  while((s[0] = c = getch()) == ' ' || c == '\t')
    ;
  i = 0;
  if(!isdigit(c) && c != '.' && c != '-'){
    if(!isalpha(c)){
      s[1] = '\0';
      return c;
    }
    else{
      while(isalpha(s[++i] = c =getch()))
	;
      s[i] = '\0';
      if(c != EOF)
	ungetch(c);
      return IDENTIFER;
    }
  }
  if(c == '-')
    while(isdigit(s[++i] = c = getch()))
      ;
  if(isdigit(c))
    while(isdigit(s[++i] = c = getch()))
      ;
  if(c == '.')
    while(isdigit(s[++i] = c = getch()))
      ;
  s[i] = '\0';
  if(c != EOF)
    ungetch(c);
  return NUMBER;
}


static int getch(void){
  return (bufp > 0) ? buf[--bufp] : getchar();
}

static void ungetch(int c){
  if (bufp >= BUFSIZE)
    printf("ungetch : too many characters\n");
  else
    buf[bufp++] = c;
}
