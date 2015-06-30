static int bits(unsigned x){
  int i = 0;
  while(x){
    x>>=1;   
    i++;
  }
  return i;
}
unsigned rightrot(unsigned x,int n){
  int bs = bits(x);
  return ((~(~0<<n)&x)<<(bs-n)) | (x>>n);
}
