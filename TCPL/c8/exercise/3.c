int _flushbuf(int x,FILE *fp){
  int bufsize;
  if((fp->flag&(_WRITE|_ERR)) != _WRITE)
    return EOF;
  bufsize = (fp->flag & _UNBUF) ? 1 : BUFSIZE;
  if(fp->base == NULL)
    if((fp->base = (char *) malloc(bufsize)) == NULL)
      return EOF;
  fp->ptr = fp->base;
  if((fp->cnt=write(fp->fd,fp->ptr,bufsize)) != BUFSIZE){
    fp->flag |= _ERR;
    return EOF;
  }
  *fp->ptr = x;
  return (unsigned char) *fp->ptr++;
}


int fflush(FILE *fp){

  if(fp == NULL){
    for(fp = _iob;fp < _iob + OPEN_MAX;fp++)
      if(fp->flag&_WRITE == _WRITE){
	if(fflush(fp) == EOF)
	  return EOF;
      }
    return 0;
  }
  if((fp->flag&(_WRITE|_ERR)) != _WRITE)
    return EOF;
  int bufsize = fp->ptr-fp->base;
  if(write(fp->fd,fp->base,bufsize) != bufsize){
    fp->flag |= _ERR;
    return EOF;
  }
  fp->ptr = fp->base;
  fp->cnt = BUFSIZE;
  return 0;
}

//这个题我没编译，不知道对不对，答案跟我的不太一样
