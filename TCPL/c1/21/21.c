#include <stdio.h>
#define MAXLINE 1001
#define YES 1
#define NO 0
#define TABSTOP 4
#deine SPA ' '
int getline(char s[],int);
void deal(char,int,int);

int main(void){
  int count=1,tag=NO,index=0;
  int spa_beg,spa_end;
  int len,line[MAXLINE];
  int inword = YES;
  while((len=getline(line,MAXLINE)) > 0){
    while(line[index] != '\0'){
      if(line[index] != SPA){
	if(inword == YES)
spa_beg = 
  /*����д������ط���ʱ�򣬳����Ѿ���ñȽϸ����ˣ��о�
   *�Ҷ�����һ�ٸ����������˼·�봦��ʽ��û�����
   *
   *
   *
   */







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
