#include <stdio.h>
static char daytab[2][13] = {
  {0,31,28,31,30,31,30,31,31,30,31,30,31},
  {0,31,29,31,30,31,30,31,31,30,31,30,31},
};

int day_of_year(int year,int month,int day){
  int i,leap;
  leap = year%4 == 0 && year%100 != 0 || year%400 == 0;
  if(month >12 || day > daytab[leap][month]){
    printf("error:invalid data.\n");
    return -1;
  }
  for(i = 1;i < month;i++)
    day += daytab[leap][i];
  return day;
}

void month_day(int year,int yesterday,int *pmonth,int *pday){
  int i,leap;
  leap = year%4 == 0 && year%100 != 0 || year%400 == 0;
  if(leap && yesterday > 366 || !leap && yesterday > 365)
    printf("error:invalid\n");
  for(i = 1;yesterday > daytab[leap][i];i++)
    yesterday -= daytab[leap][i];
  *pmonth = i;
  *pday = yesterday;
}
