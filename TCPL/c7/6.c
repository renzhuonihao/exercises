#include <stdio.h>
#include <string.h>
#define MAXLEN 1000
int get_line(char *,int,FILE *);

int main(int argc,char *argv[]){
  FILE *fp1,*fp2;
  char line1[MAXLEN],line2[MAXLEN];
  int signal1,signal2;

  if(argc != 3){
    fprintf(stderr,"%s needs two files\n",argv[0]);
    return -3;
  }else{
    if((fp1 = fopen(argv[1],"r")) == NULL){
      fprintf(stderr,"%s:can't open %s",argv[0],argv[1]);
      return -1;
    }
    if((fp2 = fopen(argv[2],"r")) == NULL){
      fprintf(stderr,"%s:can't open %s\n",argv[0],argv[2]);
      return -2;
    }
    signal1 = get_line(line1,MAXLEN,fp1);
    signal2 = get_line(line2,MAXLEN,fp2);
    while(signal1 != 0 && signal2 != 0){
      if(strcmp(line1,line2) != 0){
	printf(line1);
	printf(line2);
	return 0;
      }
      signal1 = get_line(line1,MAXLEN,fp1);
      signal2 = get_line(line2,MAXLEN,fp2);
    }
    if(!feof(fp1)){
      printf("error:%s not to the end\n",argv[1]);
      return -1;
    }
    if(!feof(fp2)){
      printf("error:%s not to the end\n",argv[2]);
      return -2;
    }
    fclose(fp1);
    fclose(fp2);
    printf("%s and %s is all the same\n",argv[1],argv[2]);
    return 0;
  }
}

int get_line(char *line,int max,FILE *fp){
  if(fgets(line,max,fp) == NULL)
    return 0;
  else
    return strlen(line);
}


/*
  ��������ʱ��ͻȻ�뵽һ�����⣬��FILE* fp��Ϊ�βεĺ����������õ�
  ʱ��ʵ�������õ�fp�Ŀ�����������fp������ôfp���´���Ϊ�������ݵĵ�
  ʱ����Ϊ�ϴε�ֵ���ǲ�����Ҫ��fp����Ϊ��̬�ģ�

  ���ǣ���Ҳ����֣����ڱȽϺ���FILE�����ʵ�ֵ��ˡ�
*/
