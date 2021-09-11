#include<stdio.h>
int GCD(int num1, int num2)
{ 
  if (num1==0 && num2==0)
    return -1;
  else if (num2!=0)
    return GCD(num2, num1%num2);
  else 
    return num1;
}
int main()
{ 
  int num1,num2,temp;
  scanf("%d %d",&num1,&num2);

  if (num1<0)
    num1=num1*(-1);
  if (num2<0)
    num2=num2*(-1);
   
  printf("%d",GCD(num1,num2));
  return 0;
   
}

