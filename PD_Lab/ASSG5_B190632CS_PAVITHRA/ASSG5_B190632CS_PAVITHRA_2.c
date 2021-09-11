#include<stdio.h>
#include<stdlib.h>
#include<limits.h>

struct heap_size
{
 long int *Q;
 int heap;
};
int HEAP_MINIMUM(struct heap_size *h);
void MIN_HEAPIFY(struct heap_size *h,int i);
void MIN_HEAP_INSERT(struct heap_size *h,int k);
void HEAP_DECREASE_KEY(struct heap_size *h,int i,int k);
int HEAP_EXTRACT_MIN(struct heap_size *h);

int HEAP_MINIMUM(struct heap_size *h)
{
 if(h->heap > 0)
  return h->Q[0];
 else
  return -1;
}
void MIN_HEAPIFY(struct heap_size *h,int i)
{
 int l,r,min,temp;
 l=2*i+1;
 r=2*i+2;
 min=i;
 
 if(l< h->heap && h->Q[l] < h->Q[min])
 	min=l;
 	 	
 if(r< h->heap && h->Q[r] < h->Q[min])
	min=r;
	
 if(min!=i)
 	{
 	temp=h->Q[i];
 	h->Q[i]=h->Q[min];
 	h->Q[min]=temp;
 	MIN_HEAPIFY(h,min);	
 	}

}

void MIN_HEAP_INSERT(struct heap_size *h,int k)
{
 (h->heap)++;
 HEAP_DECREASE_KEY(h,h->heap-1,k);
}

void HEAP_DECREASE_KEY(struct heap_size *h,int i,int k)
{
  int temp;
  h->Q[i]=k;
  while(i>=0 && h->Q[(i-1)/2] > h->Q[i])
  {
    temp=h->Q[i];
    h->Q[i]=h->Q[(i-1)/2];
    h->Q[(i-1)/2]=temp;
    i=(i-1)/2;
  }
}

int HEAP_EXTRACT_MIN(struct heap_size *h)
{
 int min;
 if(h->heap>0)
  {
   min=h->Q[0];
   h->Q[0]=h->Q[h->heap-1];
   (h->heap)--;
   MIN_HEAPIFY(h,0);
   return min;
  }
 else 
  return -1;
}
int main()
{
 int i,k;
 struct heap_size *h;
 h=(struct heap_size*)malloc(sizeof(struct heap_size));
 h->heap=0;
 h->Q=malloc(100000*sizeof(*(h->Q)));
 char op;
 scanf("%c",&op);
 while(op!='s')
 {
 switch(op)
 {
 	case 'i': scanf("%d",&k);
 		  MIN_HEAP_INSERT(h,k);
 		  break;
 	case 'e': printf("%d\n",HEAP_EXTRACT_MIN(h));
 		  break;
 	case 'm': printf("%d\n",HEAP_MINIMUM(h));
 		  break;
 	case 'd': scanf("%d %d",&i,&k);
 		  HEAP_DECREASE_KEY(h,i,k);
 		  break;
 }
 scanf("%c",&op);
 }
 return 0;
 
}

