/*
 *���ֱ���ñ��취��ʱ�临�Ӷ�ΪO��mn��
 *�о����ʱ�临�ӶȺ���Ƚϴ󣬸�s2���ظ��Ĵ����йء�
 *�����и��Ӷ�ΪO��m+n����,�õĸ���������һ��ԭ��CLRSû�׿�
 */
#include <stdio.h>
#include <string.h>
#define MAX 1000
int findchar(const char s[],char c);  //return the index 
int any(const char s1[],char s2[]);  //return the index fir occ
void squeeze(char s[],int);
int main(void){
  char s1[MAX],s2[MAX];
  int n;
  scanf("%s %s",s1,s2);
  n = any(s1,s2);
  printf("The fir occure in s1 is index %d.\n",n);
  return 0;
}

int findchar(const char s[],char c){ 
  int i = 0;
  while (s[i] != '\0'){
    if(c == s[i])
      return i;
    i++;
  }
  return i;
}

int any(const char s1[],char s2[]){
  int fir,this;

  fir = strlen(s1);
  while(s2[0] != '\0'){
    this = findchar(s1,s2[0]);
    fir = fir<this?fir:this;
    squeeze(s2,s2[0]);
  }
  if(fir >= strlen(s1))
    return -1;
  else
    return fir;
}

void squeeze(char s[],int c){
  int i,j;

  for(i=j=0;s[i] != '\0';i++)
    if(s[i] != c)
      s[j++] = s[i];
  s[j] ='\0';
}
