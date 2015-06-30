#include <stdio.h>
void rec_itoa(int);
char s[20];
int i=0;
int main(void){
  int n;
  while((scanf("%d",&n)) == 1){
    i = 0;
    rec_itoa(n);
    printf("n = %s",s);
  }  
  return 0;
}

void rec_itoa(int n){
    if(n < 0){
      s[i++] = '-';
      n = -n;
    }
    if(n/10)
      rec_itoa(n/10);
    s[i++] = n % 10 + '0';
    s[i] = '\0';
}
