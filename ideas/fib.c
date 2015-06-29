#include "head.h"
int fib_rec(int n)
{
	if(0==n)
		return 0;
	else if(1==n)
		return 1;
	else 
		return fib_rec(n-1)+fib_rec(n-2);//ji suan shun xu ?
}
int fib_lop(int n)
{
	int a,b,c,count;
	a=0;
	b=1;
	count=2;
	while(count<=n)
	{
		c=a+b;
		a=b;
		b=c;
		count++;
	}
	if(0==n)
		return 0;
	else if(1==n)
		return 1;
	else 
		return c;
}
