#include<stdio.h>
unsigned long int factorial(unsigned long int num)
{ 
  if (num<2)
    return 1;
  else
    return num*factorial(num-1);
}
int main()
{ 
  unsigned long int num;
  scanf("%lu",&num);
  printf("%lu",factorial(num));
  return 0;
}
