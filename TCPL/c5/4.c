#include <string.h>
int strend_my(char *s,char *t){
  int lt = strlen(t);
  s += strlen(s);
  t += lt;
  while(lt >= 0){
    if(*s-- == *t--)
      lt--;
    else
      return 0;
  }
  return 1;
}
