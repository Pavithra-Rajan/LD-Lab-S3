#include<stdio.h>
#include<stdlib.h>
struct node
{
	long int data;
	struct node *link;
	
};
struct QUEUE
{
	struct node *head;
	struct node *tail;
};
int QUEUE_EMPTY(struct QUEUE *Q)
{
	if(Q->head==NULL)
		return -1;
	else
		return 1;
}
struct node *create_node(long int k)
{
	struct node *x;
	x=(struct node*)malloc(sizeof(struct node));
	x->link=NULL;
	x->data=k;
	return x;
}

void ENQUEUE(struct QUEUE *Q,struct node *x)
{
 	long int k;
	scanf("%ld",&k);
	x=create_node(k);
	if(Q->head==NULL)
		Q->head=x; 
	else
		Q->tail->link=x;
	Q->tail=x;
	Q->tail->link=Q->head;
}
void DEQUEUE(struct QUEUE *Q)
{
 	if(QUEUE_EMPTY(Q)==-1)
 		printf("-1\n");
 	else
 	{	
 		printf("%ld\n",Q->head->data);
 		if(Q->head==Q->tail)
 			Q->head=Q->tail=NULL;
 		else 
 			{
 			Q->head=Q->head->link; 
 			Q->tail->link=Q->head;
 			}
 					
 	}
}
void PRINT(struct QUEUE *Q)
{
	struct node *temp;
	temp=Q->head;
	while(temp->link!=Q->head)
	{
		printf("%ld ",temp->data);
		temp=temp->link;
	}
	printf("%ld\n",temp->data);
}
int main()
{
	char op;
	struct QUEUE *Q;
	struct node *x;
	
	Q=(struct QUEUE*)malloc(sizeof(struct QUEUE));
	
	scanf("%c",&op);
	Q->head=NULL;
	Q->tail=NULL;
	while(op!='t')
	{ 	switch(op)
		{
		 case 'i': ENQUEUE(Q,x);
		 	   break;
		 case 'p': PRINT(Q);
		 	   break;
		 case 'd': DEQUEUE(Q);
		 	   break;
		 case 'e': printf("%d\n",QUEUE_EMPTY(Q));
		 	   break;	  		 	   
		}
		scanf("%c",&op);
	}
 	return 0;	 	  		 

}

