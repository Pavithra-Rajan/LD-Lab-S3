#include<stdio.h>
long int search_index(long int start,long int end,int arr[],int search)
{ 
  long int mult_index,i;
  long int middle=(start+end)/2;
  
  if(start>end)
   return -1;
   
  if(arr[middle]==search)
   { 
     for(i=middle-1;i>=0;i--)
      if(arr[i]==search)
       middle=i;
     return middle;
   }
       
  else if(arr[middle]>search)
    return search_index(start,middle-1,arr,search);
    
  else if (arr[middle]<search)
    return search_index(middle+1,end,arr,search);
  
}
int main()
{ 
  long int size,i,queries;
  int search;

  scanf("%ld",&size);
  scanf("%ld",&queries);
  
  int arr[size];
  
  for(i=0;i<size;i++)
    scanf("%d",&arr[i]);

  for(i=0;i<queries;i++)
   {
    scanf("%d",&search);
    printf("%ld",search_index(0,size-1,arr,search));
    printf("\n");
   }
  
  return 0;
}
