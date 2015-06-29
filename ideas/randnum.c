//for some randomlized algs
//generate a random num in range of [a,b)
#include <stdlib.h>
#include "head.h"
int randnum(int a,int b)
{
	return a+rand()%(b-a);
}
