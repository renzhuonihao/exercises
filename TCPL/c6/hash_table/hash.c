#include <string.h>
#include <stdio.h>
struct nlist {                 //table entry
  struct nlist *next;          //next entry in chain
  char *name;                  //defined name
  char *defn;                 //replacement text
};

#define HASHSIZE 101
static struct nlist *hashtab[HASHSIZE];   //pointer table

unsigned hash(char *s){
  unsigned hashval;
  for(hashval = 0;*s;s++)
    hashval = hashval * 31 + *s;
  return hashval % HASHSIZE;
}

struct nlist *lookup(char *s){
  struct nlist *np;
  for(np = hashtab[hash(s)];np != NULL;np = np->next)
    if(strcmp(s,np->name) == 0)
      return np;
  return NULL;
}

struct nlist *install(char *name,char *defn){
  struct nlist *np;
  unsigned hashval;
  if((np = lookup(name)) == NULL){
    np = (struct nlist *)malloc(sizeof (*np));
    if(np == NULL || (np->name = strdup(name)) == NULL)
      return NULL;
    hashval = hash(name);
    np->next = hashtab[hashval];
    hashtab[hashval] = np;
  }else
    free((void *) n->defn);
  if((np->defn = strdup(defen)) == NULL)
    return NULL;
  return np;
}
