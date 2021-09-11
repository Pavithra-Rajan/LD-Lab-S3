#include<stdio.h>
#include<stdlib.h>
struct node
{
	long int key;
	struct node *left;
	struct node *right;
	struct node *p;
};
struct tree
{
	struct node *root;
};
struct node *search(struct node *x,long int k);
void INSERT(struct tree *T,struct node *z);
void TRANSPLANT(struct tree *T, struct node* x, struct node* y);
struct node* TREE_MIN(struct node *x);
long int DELETE(struct tree* T, struct node* x);
void INORDER(struct node *T);
void PREORDER(struct node *T);
void POSTORDER(struct node *T);
struct node *create_node(long int k)
{	
	struct node *x;
	x=(struct node*)malloc(sizeof(struct node));
	x->left=NULL;
	x->right=NULL;
	x->p=NULL;
	x->key=k;
	return x;
}

struct node *search(struct node *x,long int k)
{	
	
	if(x==NULL || x->key==k)
		return x;
	if(x->key<k)
		return search(x->right,k);
	return search(x->left,k);
				
}
void INSERT(struct tree *T,struct node *z)
{	
	
	long int k;
	scanf("%ld",&k);
	z=create_node(k);
	struct node* y=NULL;
	struct node* x=T->root;
	while(x!=NULL)
		{
			y=x;
			if(z->key<=x->key)
				x=x->left;
			else
				x=x->right;
		}
	z->p=y;
	if(y==NULL)
		T->root=z;
	else if(z->key<y->key)
		y->left=z;
	else
		y->right=z;
		
		
}
void TRANSPLANT(struct tree *T, struct node* x, struct node* y)
{
	if(x->p==NULL)
		T->root=y;
	else if(x==x->p->left)
		x->p->left=y;
	else 
		x->p->right=y;
	if(y!=NULL)
		y->p=x->p;
}
struct node* TREE_MIN(struct node *x)
{
	while(x->left!=NULL)
		x=x->left;
	return x;
}
long int DELETE(struct tree* T, struct node* x)
{
	x=T->root;
	long int k;
	scanf("%ld",&k);
	x=search(x,k);
	if(x==NULL)
		return -1;
	else{
	if(x->left==NULL)
		TRANSPLANT(T,x,x->right);
	else if(x->right==NULL)
		TRANSPLANT(T,x,x->left);
	else 
		{
		struct node* y=TREE_MIN(x->right);
		if(y->p!=x)
			{
			TRANSPLANT(T,y,y->right);
			y->right=x->right;
			y->right->p=y;
			}
		TRANSPLANT(T,x,y);
		y->left=x->left;
		y->left->p=y;
		}
	return k;
	}
		
}
void INORDER(struct node *T)
{
	if(T!=NULL)
	{
		INORDER(T->left);
		printf("%ld ",T->key);
		INORDER(T->right);
	}

}
void PREORDER(struct node *T)
{
	if(T!=NULL)
	{
		printf("%ld ",T->key);
		PREORDER(T->left);
		PREORDER(T->right);
	}
}
void POSTORDER(struct node *T)
{
	if(T!=NULL)
	{
		POSTORDER(T->left);
		POSTORDER(T->right);
		printf("%ld ",T->key);
	}

}

int main()
{	
	struct tree *T;
	struct node *x;
	struct node *y;
	T=(struct tree*)malloc(sizeof(struct tree));
	T->root=NULL;
	char op;
	long int k;
	scanf("%c",&op);
	while(op!='e')
	{ 	switch(op)
		{
		 case 'a': INSERT(T,x);
		 	   break;
		 case 'i': INORDER(T->root);
		 	   printf("\n");
		 	   break;
		 case 'p': PREORDER(T->root);
		 	   printf("\n");
		 	   break;
		 case 't': POSTORDER(T->root);
		 	   printf("\n");
		 	   break;
		 case 'd': printf("%ld\n",DELETE(T,x));
		 	   break;
		 case 's': scanf("%ld",&k);
		 	   if(search(T->root,k)!=NULL)
		 	   	printf("1\n");
		 	   else
		 	   	printf("-1\n");
		 	   break;		  		 	   
		}
		scanf("%c",&op);
	}
 	return 0;	 	  		 
}
