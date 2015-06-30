#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include "syscalls.h"


int main(int argc,char *argv[]){

  int fd;
  if(argc == 1){
    cp(0,1);
  }else{
    while(--argc > 0){
      if((fd = open(*++argv,O_RDONLY,0)) == -1)
	err_or("can't open %s",*argv);
      cp(fd,1);
    }
    close(fd);
  }
  return 0;
}


void cp(int from,int to){
  char buf[BUFSIZE];
  int n;
  while((n = read(from,buf,BUFSIZE)) > 0)
    if(write(to,buf,n) != n){
      err_or("write err_or on 1");
    }
}
