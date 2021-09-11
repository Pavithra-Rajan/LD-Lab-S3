#include<stdio.h>
#include<stdlib.h>
struct stack
{
	long int A[10000];
	int top;
	int size;
};

int STACK_EMPTY(struct stack *S)
{
	if(S->top==-1)
		return -1;
	else
		return 1;
}
int STACK_FULL(struct stack *S)
{
	if(S->top==S->size-1)
		return 1;
	else
		return 0;
}
void PUSH(struct stack *S,long int k)
{
 	if(STACK_FULL(S)==1)
 		;
 	else
 	{	
 		//printf("%d\n",S->top);
 		
 		S->top=S->top+1;
 		//printf("%d\n",S->top);
 		S->A[S->top]=k;
 	}
}
void POP(struct stack *S)
{
 	if(STACK_EMPTY(S)==-1)
 		printf("-1\n");
 	else
 	{	
 		//printf("%d\n",S->top);
 		printf("%ld\n",S->A[S->top]);
 		S->top=S->top-1;
 		//printf("%d\n",S->top);
 		
 	}
}
void PRINT(struct stack *S)
{
	int i;
	for(i=S->top;i>=0;i--)
		printf("%ld ",S->A[i]);
}
int main()
{
	char op;
	struct stack *S;
	
	
	S=(struct stack*)malloc(sizeof(struct stack));
	scanf("%d",&(S->size));
	long int k;
	scanf("%c",&op);
	S->top=-1;
	while(op!='t')
	{ 	switch(op)
		{
		 case 'i': scanf("%ld",&k);
		 	   PUSH(S,k);
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

