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


//这个程序，没有对边界条件仔细推敲。实际上，对于删除链表末尾的元素仍是正确的，但
//删除的元素是第一个时，是错误的。
