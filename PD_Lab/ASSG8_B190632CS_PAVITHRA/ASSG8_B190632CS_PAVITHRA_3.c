#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct node
{
char op;
struct node *left;
struct node *right;
};
struct node* stack[60];

struct node* create_node(char c)
{
	struct node*temp;
	//printf("%c",c);
	temp=(struct node*)malloc(sizeof(struct node));
	temp->op=c;
	temp->left=NULL;
	temp->right=NULL;
	return temp;
}
void push(struct node* temp,int *top)
{
	stack[++(*top)]=temp;
}
struct node* pop(int *top)
{
	struct node*p;
	p=stack[(*top)--];
	return p;
}
void inorder(struct node* t)
{
	if(t!=NULL)
	{
		inorder(t->left);
		printf("%c",t->op);
		inorder(t->right);
	}
}
void preorder(struct node* t)
{
	if(t!=NULL)
	{
		printf("%c",t->op);
		preorder(t->left);
		preorder(t->right);
	}
}
void postorder(struct node* t)
{
	if(t!=NULL)
	{
	postorder(t->left);
	postorder(t->right);
	printf("%c",t->op);
	}
}
struct node* create_tree(char e[])
{
 	int i;
 	struct node* temp;
 	int top=-1;
 	for(i=0;i<strlen(e);i++)
	{
		if(e[i]=='*' || e[i]=='/' || e[i]=='+' || e[i]=='-')
		{
			temp=create_node(e[i]);
			temp->right=pop(&top);
			temp->left=pop(&top);
			push(temp,&top);
		}
		else
		{
			temp=create_node(e[i]);
			push(temp,&top);
		}
	}
	return temp;
}
void main()
{
	char e[60];
	char opt;
	struct node* new_node,t;
	int j,i;

	scanf("%c",&opt);
	

	while(opt!='t')
	{
	switch(opt)
	{
		case 'e': scanf("%s",e);
			  new_node=create_tree(e);
			  break;
		case 'i': inorder(new_node);
			  printf("\n");
			  break;
		case 'p': preorder(new_node);
			  printf("\n");
			  break;
		case 's': postorder(new_node);
			  printf("\n");
			  break;
	}
	scanf("%c",&opt);
	}
	
	
	

}
