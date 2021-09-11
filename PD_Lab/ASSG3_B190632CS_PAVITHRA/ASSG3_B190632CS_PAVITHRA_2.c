#include<stdio.h>
#include<limits.h>
int comp=0;
void MERGE(int A[], int p, int q, int r);
void MERGE_SORT(int A[],int p,int r)
{ 
  int mid;
  if(p<r)
  {
    mid=(p+r)/2;
    MERGE_SORT(A,p,mid);
    MERGE_SORT(A,mid+1,r);
    MERGE(A,p,mid,r);
  }
   
}
void MERGE(int A[], int p, int q, int r)
{
  
  int left_size=q-p+1;
  int right_size=r-q;
  
  int left_arr[left_size+1], right_arr[right_size+1],i;
  
  for(i=0;i<left_size;i++)
   left_arr[i]=A[p+i];
  for(i=0;i<right_size;i++)
   right_arr[i]=A[q+1+i];
   
  left_arr[left_size]=INT_MAX;
  right_arr[right_size]=INT_MAX;
  
  int j,k;
  j=0;
  k=0;
  
  for(i=p;i<=r;i++)
   {
     if(left_arr[j]<=right_arr[k])
      {
        A[i]=left_arr[j];
        j=j+1;
      }
     else
      {
        A[i]=right_arr[k];
        k=k+1;
      }
     comp++;
     
    }
 
}
void PRINT(int A[], int size)
{
 for(int i=0;i<size;i++)
  printf("%d ",A[i]);
}
int main()
{
  int size, i;
  scanf("%d",&size);
  int A[size];
  for(i=0;i<size;i++)
    scanf("%d",&A[i]);
  MERGE_SORT(A,0,size-1);
  PRINT(A,size);
  printf("\n%d",comp);
  return 0;
}
    
