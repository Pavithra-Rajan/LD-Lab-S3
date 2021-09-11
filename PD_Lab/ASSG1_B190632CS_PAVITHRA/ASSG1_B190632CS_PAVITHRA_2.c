#include <stdio.h>

int main()
{
  int no_elem, i, j;
 
  //printf ("Number of elements in the array : ");
  scanf ("%d", &no_elem);
 
  int arr[no_elem];
  //printf ("Elements: ");
  for (i = 0; i < no_elem; i++)
    scanf ("%d", &arr[i]);
    
  int temp;
  for (i = 0; i < no_elem-1; i++)
   for (j = i+1; j < no_elem; j++)
   {
     if (arr[j] < arr[i])
	{
	  temp=arr[i];
	  arr[i]=arr[j];
	  arr[j]=temp;
	}
   }
   
  //printf ("Sorted array is : ");
  for (j = 0; j < no_elem; j++)
    printf ("%d ", arr[j]);  
  

  return 0;
}
