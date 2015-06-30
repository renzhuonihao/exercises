#include <stdio.h>
#define MAX 1001
void escape(char from[],char to[]);
void unescape(char from[],char to[]);
int main(void){
  char from[MAX]= {'a' ,'\t','d','\n','d','s','\0'};   //第一次写的时候忘了加'\0',也能运行，好像以前看过cpp里说，部分初始化的数组，没有初始化的都设置为0，嗯，应该是这个原因
    char to[MAX];
    // printf("please enter the \"from string\".\n");     注意：这个程序不能用scanf()来输入，因为scanf()是不读空白字符的！应该用getline()或者gethcar()来读取，
    //scanf("%s",from);                                         或者提前定义好也行
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
      to[j] = 'n';      //感觉这个地方，不如在循环的结尾来个j++好
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
