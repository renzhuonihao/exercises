
#include <stdio.h>
int b_c1(unsigned x){
  int b;
  for(b = 0;x != 0;x >>= 1)
    if(x & 01)
      b++;
  return b;
}
int b_c2(unsigned x){
  int b=0;
  while(x){
    x &= (x - 1);
    b++;
  }
  return b;
}
int main(void){
  unsigned x;
  int b1,b2;
  while((scanf("%u",&x)) == 1){
  b1 = b_c1(x);
  b2 = b_c2(x);
  printf("b1 = %d,b2 = %d.\n",b1,b2);
  }
  return 0;
}
