#include <stdio.h>
#include <string.h>
int undef(char *s){
  struct nlist *np,*pre;
  for(np = hashtab[hash[s]];np != NULL;pre = np,np = np->next)
    if(strcmp(s,np->name) == 0){
      pre->next = np->next;
      free(np);
      free(np->name);
      free(np->defn);
      return 1;
    }
  return 0;
}


//�������û�жԱ߽�������ϸ���á�ʵ���ϣ�����ɾ������ĩβ��Ԫ��������ȷ�ģ���
//ɾ����Ԫ���ǵ�һ��ʱ���Ǵ���ġ�
