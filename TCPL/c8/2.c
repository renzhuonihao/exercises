#include "syscalls"

int get_char1(void){
  char c;
  return (read(0,&c,1) == 1) ? (unsigned char) c : EOF;
}
