#include<stdlib.h>
#include<stdio.h>

struct node{
    struct node* next;
    int data;
};

struct adjlist{
    struct node* head;
};

typedef struct Graph {
    struct adjlist* array ;
    int v ;
    int aar[10][10];
}Graph;


struct node* create_node(int data){
    struct node* temp = (struct node* )malloc((sizeof(struct node)));
    temp->data=data;
    temp->next=NULL;
    return temp;
}

// funx to creat e a graph with no values 
Graph * create_grah(int v){
struct Graph* g=(struct Graph* )malloc((sizeof(Graph)));
g->v=v;
//memory allcation 
g->array=(struct node* )malloc(v*sizeof(struct node));

//intialing the head of all the linked list 
for (int i = 0; i < v; i++)
{
    g->array[i].head=NULL;
}
for (int i = 0; i < v; i++)
{
    for (int j = 0; j < v; j++)
    {
        /* code */
    
    
    g->aar[i][j]=0;
}


return g;
}}

void addedge(Graph* g,int src,int des){

struct node* new=create_node(des);
new->next=g->array[src].head;
g->array[src].head=new;
g->aar[des][src]=1;

new=create_node(src);
new->next=g->array[des].head;
g->array[des].head=new;
g->aar[src][des]=1;
}

void remove_edge(Graph* g,int src ,int des ){
    struct node* temp  = g->array[src].head;
    struct node* prev=NULL;
    while (!temp && (temp->data=des))
    {
        prev=temp;
        temp=temp->next;
    }
    if (temp ==NULL)
    {
        return ;
    }
    if (prev!=NULL)
    {
        prev->next=temp->next;

    }
    else{
        g->array[src].head=temp->next;
    }
    free(temp);

    g->aar[src][des]=0;
    remove_edge(g,des,src);
    
    
    
}

void print_admat(Graph *g ){
    if (g==NULL)
    {
        printf("the graph is empty");
        return ;
    }
    for (int i = 0; i < g->v; i++)
    {
        for (int j = 0; j < g->v; j++)
        {
            printf("%d ",g->aar[i][j]);            
        }
        printf("\n ");
    }    
}



