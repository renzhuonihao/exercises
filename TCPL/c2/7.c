unsigned inverst(unsigned x,int p,int n){
  return (~(~0<<n)<<(p-n+1)) ^ x;
}
