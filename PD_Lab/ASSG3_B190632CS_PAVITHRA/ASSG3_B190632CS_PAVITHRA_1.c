#include<stdio.h>
int comp=0;
void insertion_sort(int *A,int size)
{ 
  int i,key,j;

  for(i=1;i<size;i++)
   {
    key=A[i];
    j=i-1;
  
    while (j>=0 && A[j]>key)
    {
      A[j+1]=A[j];
      j=j-1;
      comp++;
    }
    A[j+1]=key;
    if (j>=0)
      comp++;
   }
}

void print_sort(int *A,int size)
{
 int i;

 for(i=0;i<size;i++)
  printf("%d ",A[i]);
}
 
int main()
{ int i,size;
  scanf("%d",&size);
  
  int A[size];
  for(i=0;i<size;i++)
   scanf("%d",&A[i]);
  
  insertion_sort(A,size);
  print_sort(A,size);
  printf("\n%d",comp);
  
  return 0;
 }



