#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

#define MAXARR 100
#define MAXWORD 100

struct tnode *addtree(struct tnode *node,char *word);
int getword(char *,int);
void treeprint(struct tnode *);
int getch(void);
void ungetch(int);
char *strdup_my(char *s);
struct tnode {
  char *word;
  int count;
  struct tnode *left;
  struct tnode *right;
};

int main(void){ 
  struct tnode *root = NULL;
  char word[MAXWORD];
  while(getword(word,MAXWORD) != EOF){
    if(isalpha(word[0]))
      root = addtree(root,word);
  }
  treeprint(root);
  return 0;
}

struct tnode *addtree(struct tnode *node,char *word){
  if(node == NULL){
    node = (struct tnode *) malloc(sizeof (struct tnode));
    //node->word = word;     bug
    node->word = strdup_my(word);
    node->left = NULL;
    node->right =NULL;
    node->count = 1;
  }
  else if(strcmp(node->word,word) == 0)
    node->count++;
  else if(strcmp(node->word,word) < 0)
    node->right = addtree(node->right,word);
  else
    node->left =  addtree(node->left,word);
  return node;
}

void treeprint(struct tnode *node){
  if(node){
    treeprint(node->left);
    printf("%s %4d\n",node->word,node->count);
    treeprint(node->right);
  }
}

int getword(char *word,int lim){
  int c;
  char *w = word;
  while(isspace(c = getch()))
    ;
  if(c != EOF)
    *w++ = c;
  if(!isalpha(c)){
    *w++ = '\0';
    return c;
  }
/* 
 *w = c;  这行最开始理解错了
 while(isalnum(c = getch()))   可能有溢出的危险
 *w++ = c;
 ungetch(c);
  */
for(;--lim > 0;w++)
  if(!isalnum(*w = getch())){
ungetch(*w);
break;
}
*w = '\0';
return *word;
}

static int arr[MAXARR];
static int ap = 0;

int getch(void){  //此处用条件运算符比较好
  if(ap > 0)
    return arr[--ap];
  else
    return getchar();
}
void ungetch(int c){
  if(ap < MAXARR)
    arr[ap++] = c;
  else
    printf("ungetch:stack is full\n");
}

char *strdup_my(char *word){
  char *p;
  p = (char *) malloc(strlen(word) +1 );
  if(p)  
    strcpy(p,word);
  return p;
}
