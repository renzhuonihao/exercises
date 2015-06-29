#include <stdio.h>
#include "head.h"
int sum(int a ,int b)
{
	return a+b;
}
int main(void)
{
	printf("fib_rec is %d\n",fib_rec(randnum(sum(12,1),sum(23,2))));
	return 0;
}
