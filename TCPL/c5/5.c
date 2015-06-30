void strncpy_my(char *s,char *t,int n){
  while(n && (*s++ = *t++))
    n--;
  *s = '\0';
}
void strncat_my(char *s,char *t,int n){
  while(*s != '\0')
    s++;
  strncpy_my(s,t,n);
}
int strncmp_my(char *s,char *t,int n){
  while(n){
    if(*s == *t){
      s++;
      t++;
      n--;
    }
    else
      return *s - *t;
  }
  return 0;
}
