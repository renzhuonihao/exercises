#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
void minprintf(char *fmt,...);
char *getnum(double *,char *p);
int main(void){
  minprintf("%10s","hello, world");
  minprintf("%.10s","hello, world");
  minprintf("%-10s","hello, world");  
  minprintf("%.15s","hello, world");
  minprintf("%-15s","hello, world");
  minprintf("%15.10s","hello, world");
  minprintf("%-15.10s","hello, world");
  minprintf("%10.1",32.78);
  return 0;
}
char *getnum(double *num,char *p){
  char s[10];
  int i = 0;
  while(!isalpha(*p))
    s[i++] = *p++;
  s[i] = '\0';
  *num = atof(s);
  return p;
}
void minprintf(char *fmt, ...){
  va_list ap;
  char *p,*sval;
  int ival,width,precision;
  double dval,num;
  num = 0.0;
  width = precision = 0;
  va_start(ap,fmt);
  for(p = fmt;*p;p++){
    if(*p != '%'){
      putchar(*p);
      continue;
    }
    if(*++p == '.' || *p == '-' || isdigit(*p))
      p = getnum(&num,p);
    printf("num = %f\n",num);
    width = (int) num;
    num = num - (int)num;
    //while((num - (int)num) > 0){
    while(precision >0 && precision < 20){      
      num *= 10;
      precision = (int)num + precision * 10;
    }
    printf("%d %d\n",width,precision);
    switch(*p){
    case 'd':
      ival = va_arg(ap,int);
      printf("%*.*d",width,precision,ival);
      break;
    case 'f':
      dval = va_arg(ap,double);
      printf("%*.*f",width,precision,dval);
      break;
    case 's':
      printf("%*.*s",width,precision,sval = va_arg(ap,char *));
      break;
    default:
      putchar(*p);
      break;
    }
  }
  va_end(ap);
}


//这个程序有bug，在处理精度的时候,非常严重的bug，还是推到重来吧
//为什么没输出？
//这个程序写的太烂了
