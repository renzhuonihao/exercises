#include <stdio.h>
int day_of_year(int year,int month,int day);
void month_day(int year,int yesterday,int *pmonth,int *pday);
int main(void){
  int m,d;
  month_day(1988,60,&m,&d);
  printf("1988's 60th is %d month %d day\n",m,d);
  printf("2000's 3.1 is %d day\n",day_of_year(2000,3,1));
  month_day(2133,400,&m,&d);
  day_of_year(2313,321,32);
  day_of_year(1312,2,321);
  return 0;
}
