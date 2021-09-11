#include<stdio.h>

int comp=0;
void PARTITION(int A[], int p, int *q, int r);
void QUICK_SORT(int A[],int p, int r)
{ 
  int q=0;
  if(p<r)
  {
    PARTITION(A,p,&q,r);
    QUICK_SORT(A,p,q-1);
    QUICK_SORT(A,q+1,r);
  }
   
}
void PARTITION(int A[], int p, int *q, int r)
{

  int element=A[r];
  int i=p-1;
  int j,temp;
  
  for(j=p;j<=r-1;j++)
   if(A[j]<=element)
    {
     i++;
     temp=A[i];
     A[i]=A[j];
     A[j]=temp;
     comp++;
    }
    else
     comp++;
    
  temp=A[i+1];
  A[i+1]=A[r];
  A[r]=temp;
  
  *q=i+1;
  
}
void PRINT(int A[], int n)
{
 for(int i=0;i<n;i++)
  printf("%d ",A[i]);
}
int main()
{
  int n, i;
  scanf("%d",&n);
  int A[n];
  for(i=0;i<n;i++)
    scanf("%d",&A[i]);
  QUICK_SORT(A,0,n-1);
  PRINT(A,n);
  printf("\n%d",comp);

  return 0;
}
    
