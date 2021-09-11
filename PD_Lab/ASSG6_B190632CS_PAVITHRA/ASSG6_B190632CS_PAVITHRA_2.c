#include<stdio.h>
#include<stdlib.h>
struct node
{
	long int key;
	struct node *next;
	struct node *prev;
};
struct sll
{
	struct node *head;
};

struct node *create_node(long int k)
{	
	struct node *x;
	x=(struct node*)malloc(sizeof(struct node));
	x->next=NULL;
	x->prev=NULL;
	x->key=k;
	return x;
}

struct node *list_search(struct sll *L,long int k)
{	
	int c=0;
	struct node *temp;
	temp=L->head;
	while(temp!=NULL)
		if(temp->key==k)
		{	c++;
			return temp;
		}
		else
			temp=temp->next;
	if(c==0)
		return NULL;
		
}
void LIST_INSERT_FRONT(struct sll *L,struct node *x)
{	
	long int k;
	scanf("%ld",&k);
	x=create_node(k);

	x->next=L->head;
	x->prev=NULL;
	if(L->head!=NULL)
		(L->head)->prev=x;
	L->head=x;
}

void LIST_INSERT_TAIL(struct sll *L,struct node *x)
{	
	long int k;
	struct node *temp;
	scanf("%ld",&k);
	x=create_node(k);
	if(L->head==NULL)
		L->head=x;
	else
		{
		 temp=L->head;
		 while(temp->next!=NULL)
		 	temp=temp->next;
		 temp->next=x;
		 x->prev=temp;
		 x->next=NULL;
		 
		 }
	
}

void LIST_INSERT_AFTER(struct sll *L,struct node *x, struct node *y)
{	
	long int key,key_search;
	scanf("%ld",&key);
	scanf("%ld",&key_search);
	y=list_search(L,key_search);
	if(y==NULL)
		exit(0);
	else
		{
		x=create_node(key);
		
		x->next=y->next;
		if(y->next!=NULL)
			(y->next)->prev=x;
		x->prev=y;
		y->next=x;
	
		}
	
}

void LIST_INSERT_BEFORE(struct sll *L,struct node *x, struct node *y)
{	
	long int k,key_search;
	int c=0;
	scanf("%ld",&k);
	scanf("%ld",&key_search);
	struct node *temp;
	struct node *before;
	
	temp=L->head;
	before=NULL;
	while(temp!=NULL)
		if(temp->key==key_search)
		{	c++;
			y=temp;
			break;
		}
		else
			{
			before=temp;
			temp=temp->next;
			}
	if(c==0)
		y=NULL;
	

	if(y==NULL)
		exit(0);
	else if(y==L->head)
		{
		x=create_node(k);
		x->next=y;
		x->prev=NULL;
		y->prev=x;
		L->head=x;
		
		}
	else
		{
		x=create_node(k);
		x->next=y;
		y->prev=x;
		x->prev=before;
		before->next=x;
		}
	
}


void LIST_DELETE(struct sll *L,struct node *x)
{	
	long int k;
	scanf("%ld",&k);
	x=list_search(L,k);
	struct node *temp;
	
	temp=L->head;
	if(x==NULL)
		printf("-1\n");
	else if(x==temp)
		{
		L->head=temp->next;
		temp->prev=NULL;
		printf("%ld\n",k);
		free(temp);
		}
	else
	{	
		
		while(temp!=NULL)
			if(temp->next==x)
				{
				if(x->next!=NULL)
					{
					temp->next=x->next;
					(x->next)->prev=temp;
					}
				else 
					temp->next=NULL;
				
				}
			else 
				temp=temp->next;
		printf("%ld\n",k);
		free(x);
	}	
	
}

void LIST_DELETE_FIRST(struct sll *L)
{	
	struct node *temp;
	temp=L->head;
	if(temp!=NULL)
		{
		
		printf("%ld\n",temp->key);
		if(temp->next!=NULL)
			L->head=temp->next;
		else
			L->head=NULL;
		
		}
	else if(temp==NULL)
		printf("-1\n");
	free(temp);	
}

void LIST_DELETE_LAST(struct sll *L)
{	
	struct node *temp;
	
	temp=L->head;
	
	if(temp==NULL)
		printf("-1\n");
	else
	{
	while(temp!=NULL)
		       {
			if(temp->next==NULL)
				{
				printf("%ld\n",temp->key);
				if(temp->prev!=NULL)
				 	{
				 	(temp->prev)->next=NULL;
				 	break;
				 	}
				else
					{
					L->head=NULL;
					break;
					}
				
				}
			else
				temp=temp->next;
			}
	
	
	}
	free(temp);	
}

void PRINT(struct sll *L)
{
	struct node *temp;
	temp=L->head;
	while(temp!=NULL)
	{
		printf("%ld ",temp->key);
		temp=temp->next;
	}
	printf("\n");
}

void LIST_SEARCH(struct sll *L,long int k)
{
	struct node *temp;
	temp=list_search(L,k);
	if(temp!=NULL)
		printf("1\n");
	else
		printf("-1\n");
}

int main()
{	
	struct sll *L;
	struct node *x;
	struct node *y;
	
	L=(struct sll*)malloc(sizeof(struct sll));
	char op;
	long int k;
	scanf("%c",&op);
	while(op!='e')
	{ 	switch(op)
		{
		 case 'f': LIST_INSERT_FRONT(L,x);
		 	   break;
		 case 'p': PRINT(L);
		 	   break;
		 case 't': LIST_INSERT_TAIL(L,x);
		 	   break;
		 case 'a': LIST_INSERT_AFTER(L,x,y);
		 	   break;
		 case 'b': LIST_INSERT_BEFORE(L,x,y);
		 	   break;
		 case 'd': LIST_DELETE(L,x);
		 	   break;
		 case 'i': LIST_DELETE_FIRST(L);
		 	   break;	
		 case 'l': LIST_DELETE_LAST(L);
		 	   break;
		 case 's': scanf("%ld",&k);
		 	   LIST_SEARCH(L,k);
		 	   break;		  		 	   
		}
		scanf("%c",&op);
	}
 	return 0;	 	  		 
}
