#include <stdio.h>
#define MAX 1001
int get_line(char s[],int lim){
  int c,i;
  for(i=0;i<lim-1 && (c=getchar())!=EOF && c!='\n';i++)
    s[i] = c;
  if(c == '\n'){
    s[i] = c;
    ++i;
  }
  s[i] = '\0';
  return i;
}

int strindex_my(char s[],char t[]){
  int i,j,sames,index,max;
  int arr[20];
  for(index = 0;index < 20;index++)
    arr[index] = -1;
  max = -1;
  i = j = sames = index =  0;
  while(s[i]){
    if(s[i] == t[j]){
      sames++;
      j++;
      if(t[j] == '\0'){
	arr[index++] = i - sames + 1;
	j = 0;
	sames = 0;
      }
    }
    else{
      sames = 0;
      j = 0;
    }
    i++;
  }
  for(i = 0;i<index;i++)
    max = max > arr[i] ? max : arr[i];
  return max ;
}

int main(void){
  char line[MAX];
  char pattern[] = "ould";
  while(get_line(line,MAX)>0) {
    printf("%d.\n",strindex_my(line,pattern));
    if(strindex_my(line,pattern)>= 0)
      printf("%s",line);
  }
  return 0;
}
