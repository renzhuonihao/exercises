/*htoi()�������ת�����Ľ����ʮ���Ƶģ�û�н���תΪʮ�����Ƶ���
 *������ô��ӡʮ�����Ƶ����ˣ�������Ҫ�����Ѿ�д�꣬���ֻ�Ǳ߽߱ǽǵĶ�����
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

