#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
#include<math.h>
struct node
{
	int op;
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
struct node *create_node(int n)
{
	struct node *x;
	x=(struct node*)malloc(sizeof(struct node));
	x->link=NULL;
	x->op=n;
	return x;
}
void PUSH(struct node *S,int n)
{
	long int k;
	struct node *x;
	//printf("%d\n",n);
	x=create_node(n);
	x->link=S->top;
 	S->top=x; 
 	//printf("PUSHED %d\n",n);
 		
}
int POP(struct node *S)
{
 	if(STACK_EMPTY(S)==-1)
 		;
 	else
 	{	
 		//printf("%d\n",S->top);
 		int n=S->top->op;
 		S->top=S->top->link;
 		//printf("%d\n",S->top);
 		return n;
 		
 	}
}
void eval_post(char e[])
{
	int i;
	char c;
	struct node* S;
	S=(struct node*)malloc(sizeof(struct node));
	S->top=NULL;
	//printf("%s\n",e);
	for(i=0;i<strlen(e);i++)
		{
		//printf("%c %d ",e[i],i);
		if((e[i]==' '|| i==strlen(e)) && isdigit(e[i-1]))
		{
			int j=i-1;
			int num=0;
			int p=0;
			//printf("j=%d\n",j);
			while(j>=0 && e[j]!=' ')
			{
				num+=(e[j]-48)*pow(10,p);
				p++;
				//printf("p=%d\n",p);
				j--;
			}
			//printf("num=%d\n",num);
			PUSH(S,num);
		}			 
	
		
		else if(e[i]=='+' || e[i]=='-' || e[i]=='*' || e[i]=='/')
		{
			
			
			
			int val1=POP(S);
			int val2=POP(S);
			
			switch(e[i])
			{
			case '+':PUSH(S,val2+val1);
				 break;
			case '-':PUSH(S,val2-val1);
				 break;
			case '*':PUSH(S,val2*val1);
				 break;
			case '/':PUSH(S,val2/val1);
				 break;
			}
				//printf("%d %c %d\n",val1,e[i],val2);
				
			
			//printf("%c\n",e[i]);
		}
		
		}
	printf("%d",POP(S));
	
		
}

int main()
{
	char e[100];
	scanf("%[^\n]%*c",e);

	eval_post(e);
	
 	return 0;	 	  		 

}
