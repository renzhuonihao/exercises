#include <stdio.h>
#define IN 1
#define OUT 0
#define MWL 10
int main(void){
  int arr[MWL+1];
  int index,lg_ct,maxtime = 0;
  int c,state=OUT;
  int x,y;

  for(index = 0;index < MWL + 1;index++){
    arr[index] = 0;
  }
  while((c =getchar()) != EOF){
    if (c != '\n' && c != '\t' && c != ' '){
      if (state == OUT){
	state = IN;
	lg_ct = 1;
      }
      else 
	lg_ct++;
    }
    else if (state == IN){
      state = OUT;
      if (lg_ct > MWL)
	arr[MWL]++;
      else
	arr[lg_ct-1]++;
    }
  }
/*  for(index =0;index < MWL + 1;index++)
    printf("%3d",arr[index]);
    printf("\n");
*/
  for(index = 0;index < MWL + 1;index++){
    if(arr[index] > maxtime)
      maxtime = arr[index];
  }
  for(y = maxtime;y >0;y--){
    printf("%4d  |",y);
    for(x = 0; x < MWL + 1;x++){
      if(arr[x] >= y)
	printf(" * ");
      else 
	printf("   ");
    }
    putchar('\n');
  }
  printf("      +");
  for(index = 0;index < MWL + 1;index++)
    printf("---");
  printf("\n       ");
  for(index = 0;index < MWL;index++)
    printf(" %d ",index+1);
  printf(" >%d\n",MWL);
  return 0;
}
