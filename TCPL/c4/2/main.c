#include <stdio.h>
double atof_my(char s[]);
int main(void){

  char line[20];
  double num;
  while(scanf("%s",line) == 1){
  num = atof_my(line);
  printf("%f",num);
  }
  return 0;
}
