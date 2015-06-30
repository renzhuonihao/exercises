//这个比1.c写的还烂，重写重写。
#include <stdio.h>
#include <ctype.h>
int getch(void);
void ungetch(int);

int getfloat(float *pf){

  int c,sign;
  float power;
  while(isspace(c = getch()))
    ;
  if(!isdigit(c) && c != EOF && c != '+' && c != '-' && c != '.'){
    ungetch(c);
    return 0;
  }
  sign = (c == '-') ? -1 : 1;
  if(c == '+' || c == '-'){
    c = getch();
    if(!isdigit(c)){
      ungetch(c);
      ungetch((sign == 1) ? '+' : '-');
      return 0;
    }
  }
  for(*pf = 0.0;isdigit(c); c = getch())
    *pf = 10.0 * *pf + (c - '0');
  if(c == '.')
    c = getch();
  for(power = 1.0;isdigit(c);c = getch()){
    *pf = 10.0 * *pf + (c - '0');
    power *= 10.0;
  }
  *pf = sign * *pf / power;
  if(c != EOF)
    ungetch(c);
  return c;
}
