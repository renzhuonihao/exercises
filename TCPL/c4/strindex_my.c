/*I write this function by myself,
idea is from 1.20 or 1.21*/
int strindex_my(char s[],char t[]){
  int i,j,sames;
  i = j = sames = 0;
  while(s[i]){
    if(s[i] == t[j]){
      sames++;
      j++;
      if(t[j] == '\0')
	return i - sames + 1;
    }
    else{
      sames = 0;
      j = 0;
    }
    i++;
  }
  return -1;
}
