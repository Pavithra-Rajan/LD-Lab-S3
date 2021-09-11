#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct node
{
	char op;
	struct node *link;
	struct node *top;
};
int prec(char c)
{
	switch(c)
	{
	case '+': return 1;break;
	case '-': return 1;break;
	
	case '*': return 2;break;
	case '/': return 2;break;
	case '(': return 0;break;
	}
}
int STACK_EMPTY(struct node *S)
{
	if(S->top==NULL)
		return -1;
	else
		return 1;
}
struct node *create_node(char c)
{
	struct node *x;
	x=(struct node*)malloc(sizeof(struct node));
	x->link=NULL;
	x->op=c;
	return x;
}
void PUSH(struct node *S,char c)
{
	long int k;
	struct node *x;
	
	x=create_node(c);
	x->link=S->top;
 	S->top=x; 
 		
}
char POP(struct node *S)
{
 	if(STACK_EMPTY(S)==-1)
 		;
 	else
 	{	
 		//printf("%d\n",S->top);
 		char c=S->top->op;
 		S->top=S->top->link;
 		//printf("%d\n",S->top);
 		return c;
 		
 	}
}
void inf_to_post(char e[])
{
	int i;
	char c;
	struct node* S;
	S=(struct node*)malloc(sizeof(struct node));
	S->top=NULL;
	//printf("%s\n",e);
	for(i=0;i<strlen(e);i++)
		{
		if((e[i]>='a' && e[i]<='z') || (e[i]>='A' && e[i]<='Z'))
			printf("%c",e[i]);
	
		else if(e[i]=='(')
			PUSH(S,'(');
		else if(e[i]==')')
		{
			while(STACK_EMPTY(S)!=-1 && S->top->op!='(')
			{
				printf("%c",POP(S));
			}
			POP(S);
			
		}
		else
			{
			if(STACK_EMPTY(S)!=-1)
				c=S->top->op;
			//printf("%c",c);
			
			while(STACK_EMPTY(S)!=-1 && prec(c)>=prec(e[i]) ) 
			{
				printf("%c",POP(S));
				if(STACK_EMPTY(S)!=-1)	
					c=S->top->op;
			}
			PUSH(S,e[i]);
			//printf("%c\n",e[i]);
			}
		
		}
	if(i==strlen(e))
	while(STACK_EMPTY(S)!=-1)
		printf("%c",POP(S));
		
}

int main()
{
	char e[50];
	scanf("%s",e);

	inf_to_post(e);
	
 	return 0;	 	  		 

}
