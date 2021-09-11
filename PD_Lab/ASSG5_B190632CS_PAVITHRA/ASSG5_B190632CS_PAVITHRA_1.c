#include<stdio.h>
#include<stdlib.h>
#include<math.h>
struct heap_size
{
 int *A;
 int heap;
 int size;
};
int count=0;
void HEAP_SORT(struct heap_size *h);
void BUILD_MAX_HEAP(struct heap_size *h);
void MAX_HEAPIFY(struct heap_size *h,int i);

void MAX_HEAPIFY(struct heap_size *h, int i)
{
 int l,r,max,temp;
 l=2*i+1;
 r=2*i+2;
 max=i;

 if(l<(h->heap) && h->A[max] < h->A[l])
 {	count++;
 	max=l;
 }
 else if(l<(h->heap))
  	count++;

 if(r<(h->heap) && h->A[max] < h->A[r])
 {	count++;
 	max=r;
 }
 else if(r<(h->heap))
  	count++;

 if(max!=i)
 	{
 	temp=h->A[i];
 	h->A[i]=h->A[max];
 	h->A[max]=temp;
 	MAX_HEAPIFY(h,max);
 	}

}

void HEAP_SORT(struct heap_size *h)
{
 BUILD_MAX_HEAP(h);
 int i,temp;
 for(i=((h->size)-1);i>=1;i--)
 {
  	temp=h->A[0];
  	h->A[0]=h->A[i];
  	h->A[i]=temp;
  	(h->heap)--;
	MAX_HEAPIFY(h,0);
 }
}

void BUILD_MAX_HEAP(struct heap_size *h)
{
 int i;
 h->heap=h->size;
 for(i=(h->size-1)/2;i>=0;i--)
  MAX_HEAPIFY(h,i);
}

int main()
{
 int i;
 struct heap_size *h;
 h=(struct heap_size*)malloc(sizeof(struct heap_size));
 scanf("%d",&(h->size));
 h->A=malloc((h->size)*sizeof(*(h->A)));
 for(i=0;i<(h->size);i++)
 	scanf("%d",&h->A[i]);

 HEAP_SORT(h);

  for(i=0;i<(h->size);i++)
 	printf("%d ",h->A[i]);
 printf("\n%d",count);

 return 0;

}
