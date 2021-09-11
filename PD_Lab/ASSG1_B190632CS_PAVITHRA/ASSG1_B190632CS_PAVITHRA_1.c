#include <stdio.h>

int main ()
{
  int no_elem, ser_elem, i, count = 0;
  
  //printf ("Number of elements in the array : ");
  scanf ("%d", &no_elem);
  
   int arr[no_elem];
   //printf ("Elements: ");
   for (i = 0; i < no_elem; i++)
     scanf ("%d", &arr[i]);
    
   //printf ("Enter the element to be searched : ");
   scanf ("%d", &ser_elem);
   
   //printf ("Position of element is : ");
   for (i = 0; i < no_elem; i++)
   {
    if (arr[i] == ser_elem)
	{
	  printf ("%d ", i);
	  count++;
	}
   }
   
    if (count == 0)
      printf ("-1");
    
   return 0;
}
