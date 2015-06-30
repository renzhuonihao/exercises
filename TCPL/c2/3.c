/*htoi()这个函数转换出的结果是十进制的，没有将其转为十六进制的数
 *忘了怎么打印十六进制的数了，而且主要部分已经写完，这个只是边边角角的东西。
 *
 */
#include <stdio.h>
#include <ctype.h>
#define MAX 10
int htoi(char s[]);
int main(void){
  char s[MAX];
  int i,n;

  i = 0;
  scanf("%s",s);
  while(s[i] != '\0')
    tolower(s[i++]);
  n = htoi(s);
  printf("%d.\n",n);
}

int htoi(char s[]){
  int i,n,current;

  i = n =0;
  while(s[i] != '\0'){
    if(isdigit(s[i]))
      current = s[i]- '0';
    else if(s[i] <= 'f' && s[i] >= 'a')
      current =s[i] -'a' + 10;
    else
      current = 0;
    i++;
    n = 16 * n + current;
  }
  return n;
}

