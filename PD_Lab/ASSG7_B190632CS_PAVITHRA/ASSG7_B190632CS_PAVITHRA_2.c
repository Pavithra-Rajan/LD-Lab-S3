#include<stdio.h>
#include<stdlib.h>
struct node
{
	long int data;
	struct node *link;
	struct node *top;
};

int STACK_EMPTY(struct node *S)
{
	if(S->top==NULL)
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
void PUSH(struct node *S,struct node *x)
{
	long int k;
	scanf("%ld",&k);
	x=create_node(k);
	x->link=S->top;
 	S->top=x; 
 		
}
void POP(struct node *S)
{
 	if(STACK_EMPTY(S)==-1)
 		printf("-1\n");
 	else
 	{	
 		//printf("%d\n",S->top);
 		printf("%ld\n",S->top->data);
 		S->top=S->top->link;
 		//printf("%d\n",S->top);
 		
 	}
}
void PRINT(struct node *S)
{
	struct node *temp;
	temp=S->top;
	while(temp!=NULL)
	{
		printf("%ld ",temp->data);
		temp=temp->link;
	}
	printf("\n");
}
int main()
{
	char op;
	struct node *S;
	struct node *x;
	
	
	S=(struct node*)malloc(sizeof(struct node));
	long int k;
	scanf("%c",&op);
	S->top=NULL;
	while(op!='t')
	{ 	switch(op)
		{
		 case 'i': PUSH(S,x);
		 	   break;
		 case 'p': PRINT(S);
		 	   break;
		 case 'd': POP(S);
		 	   break;
		 case 'e': printf("%d\n",STACK_EMPTY(S));
		 	   break;		  		 	   
		}
		scanf("%c",&op);
	}
 	return 0;	 	  		 

}

