#include <stdio.h>
#define MAX 1001
void escape(char from[],char to[]);
void unescape(char from[],char to[]);
int main(void){
  char from[MAX]= {'a' ,'\t','d','\n','d','s','\0'};   //��һ��д��ʱ�����˼�'\0',Ҳ�����У�������ǰ����cpp��˵�����ֳ�ʼ�������飬û�г�ʼ���Ķ�����Ϊ0���ţ�Ӧ�������ԭ��
    char to[MAX];
    // printf("please enter the \"from string\".\n");     ע�⣺�����������scanf()�����룬��Ϊscanf()�ǲ����հ��ַ��ģ�Ӧ����getline()����gethcar()����ȡ��
    //scanf("%s",from);                                         ������ǰ�����Ҳ��
  escape(from,to);
  printf("After escaping,it is\n %s.\n",to);
  unescape(to,from);
  printf("After unescaping,it is\n %s.\n",from);
  //  printf("*\\*");
  return 0;
}

void escape(char from[],char to[]){
  int i,j;
 
  i = j = 0;
  while(from[i]){
    switch(from[i]){
    case '\t':
      to[j++] = '\\';
      to[j] = 't';
      break;
    case '\n':
      to[j++] = '\\';
      to[j] = 'n';      //�о�����ط���������ѭ���Ľ�β����j++��
      break;
    default:
      to[j] = from[i];
      break;
    }
    i++;
    j++;
  }
  to[j] = '\0';
}

void unescape(char from[],char to[]){
  int i,j;

  i = j = 0;
  while(from[i]){
    switch(from[i]){
    case '\\':{
      switch(from[++i]){
      case 't':
	to[j] = '\t';
	break;
      case 'n':
	to[j] = '\n';
	break;
      default:
	to[j++] = '\\';
	to[j] = from[i];  
	break;
      }
    }
      break;
    default:
      to[j] = from[i];
      break;
    }
    i++;
    j++;
  }
  to[j] = '\0';
}
