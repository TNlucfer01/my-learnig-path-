#include<stdio.h>
#include<stdlib.h>

typedef struct {
    int data;
    int color;
    node* left;
    node* right;
    node* parent;
}node;
#define RED 1
#define BLACK 2     
node* create_node(int data)
{
    node* new=(node*)malloc(sizeof(node));
    new->color=RED;
    new->data=data;
    new->left=NULL;
    new->right=NULL;
    new->parent=NULL;
    return new;   
}

node* grandpa(node* root){

return root->parent->parent;    
}
node* get_uncle(node* node){

    if (node->parent==node->parent->parent->left)
    {
        return node->parent->parent->right;
    }    
    else{
        return node->parent->parent->left;
    }
}
void insert(node* root,int data){
    node* uncle=get_uncle(root);
  node* grand=  grandpa(root);
    if (root==NULL)
    {
        root->data=data;
        root->color=BLACK;
    }
    else if(uncle->color==RED){
    uncle->color=BLACK;
    if (grand->color==BLACK)
    {
     grand->color=RED;   /* code */
    }
    else{
        grand->color=BLACK;
    }

           

    }
    else if(uncle->color==BLACK){
        
    }

}