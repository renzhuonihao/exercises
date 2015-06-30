#include <string.h>
int jfun(char s[]){
  int i ;
  for(i=0;s[i];i++)
    s[i] = tolower(s[i]);
  if(strstr(s,"sin"))
    return 's';
  if(strstr(s,"pow"))
    return 'p';
  if(strstr(s,"exp"))
      return 'e';
  return -1;
}
