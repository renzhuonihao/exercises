void stract_my(char *to,char *from){
  while(*to != '\0'){
    to++;
  }
  while((*to++ = *from++) != '\0')
    ;
}
