#include <ctype.h>
#include <math.h>
double atof_my(char s[]){
  double val,power,pow_e;
  int i,sign_v,sign_p;
  power = 1.0;
  for(i = 0;isspace(s[i]);i++)
    ;
  sign_v = (s[i] == '-') ? -1 : 1;
  if(s[i] == '-' || s[i] == '+')
    i++;
  for(val = 0.0;isdigit(s[i]);i++)
    val = 10.0 * val + (s[i] - '0');
  if(s[i] == '.'){
    i++;
    for(power = 1.0;isdigit(s[i]);i++){
      val = 10.0 * val + (s[i] - '0');
      power /= 10.0;
    }
  }
  if(s[i] == 'e' || s[i] == 'E'){
    i++;
    sign_p = (s[i] == '-') ? -1 : 1;
    if(s[i] == '-' || s[i] == '+')
      i++;
    for(pow_e = 0.0;isdigit(s[i]);i++)
      pow_e = 10.0 *pow_e + (s[i] - '0');
        power *= pow(10.0,sign_p * pow_e);

  }
  return sign_v * val * power;
}
