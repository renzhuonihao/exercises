#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

void err_or(char *fmt,...){
  va_list args;

  va_start(args,fmt);
  fprintf(stderr,"error: ");
  vfprintf(stderr,fmt,args);
  fprintf(stderr,"\n");
  va_end(args);
  exit(1);
}
