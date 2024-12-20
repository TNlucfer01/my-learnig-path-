#include<stdlib.h>
#include<stdio.h>
#include<stdbool.h>

typedef struct  node{
    struct node* next;
    int data;
    int weight;
}node;

typedef struct  adjlist{
    struct node* head;
}adjlist;

typedef struct Graph {
    struct adjlist* array ;
    int v;
    int aar[10][10]; // Adjacency matrix
}Graph;

// Function to create a new node
struct node* create_node(int data,int wieght) {
    struct node* temp = (struct node* )malloc(sizeof(struct node));
    temp->data = data;
    temp->next = NULL;
    temp->weight=wieght;
    return temp;
}

// Function to create a graph with v vertices
Graph* create_graph(int v) {
    struct Graph* g = (struct Graph* )malloc(sizeof(Graph));
    g->v = v;
    
    // Memory allocation for adjacency list
    g->array = (struct adjlist* )malloc(v * sizeof(struct adjlist));

    // Initialize the head of all the linked lists
    for (int i = 0; i < v; i++) {
        g->array[i].head = NULL;
    }
    
    // Initialize the adjacency matrix
    for (int i = 0; i < v; i++) {
        for (int j = 0; j < v; j++) {
            g->aar[i][j] = 0;
        }
    }

    return g;
}

// Function to add an edge to the graph
void add_edge(Graph* g, int src, int des,int weight) {
    // Add from src to des (adjacency list)
    struct node* new1 = create_node(des,weight);
    new1->next = g->array[src].head;
    g->array[src].head = new1;
    g->aar[des][src] = weight;



  /*  // Add from des to src (adjacency list)
    new1 = create_node(src);
    new1->next = g->array[des].head;
    g->array[des].head = new1;
    g->aar[src][des] = weight;
*/
}

// Function to remove an edge from the graph
void remove_edge(Graph* g, int src, int des) {
    struct node* temp = g->array[src].head;
    struct node* prev = NULL;

    // Traverse until the desired node is found
    while (temp != NULL && temp->data != des) {
        prev = temp;
        temp = temp->next;
    }

    // If edge not found
    if (temp == NULL) {
        return;
    }

    // Remove the edge in the adjacency list
    if (prev != NULL) {
        prev->next = temp->next;
    } else {
        g->array[src].head = temp->next;
    }
    free(temp);

    // Remove the edge in the adjacency matrix
    g->aar[src][des] = 0;
    g->aar[des][src] = 0;
}

// Function to print the adjacency matrix

void print_adj_matrix(Graph *g) {
    if (g == NULL || g->aar == NULL) {
        printf("The graph is empty or uninitialized.\n");
        return;
    }

    printf("Adjacency Matrix:\n");

    // Print column headers
    printf("    "); // Space for row headers
    for (int j = 0; j < g->v; j++) {
        printf("%3d ", j);
    }
    printf("\n");

    // Print row headers and matrix values
    for (int i = 0; i < g->v; i++) {
        printf("%3d ", i); // Row header
        for (int j = 0; j < g->v; j++) {
            printf("%3d ", g->aar[i][j]);
        }
        printf("\n");
    }
}

// Queue structure for BFS
struct queue {
    int last, front;
    int* aary;
};

#define MAX_NODES 100

// Function to perform BFS
void bfs(Graph* g, int v, int num) {
    int visited[MAX_NODES] = {0}; // Initialize visited array to 0 (false)
    
    struct queue q;
    q.front = q.last = 0;
    q.aary = (int *)malloc(num * sizeof(int)); // Allocate memory for queue

    visited[v] = 1; // Mark the start node as visited
    q.aary[q.last++] = v; // Enqueue start node

    while (q.front < q.last) {
        // Dequeue a node from the queue
        int node = q.aary[q.front++];
        printf("%d ", node); // Process the node

        // Explore all neighbors
        for (int i = 0; i < num; i++) {
            if (g->aar[node][i] == 1 && !visited[i]) {
                visited[i] = 1; // Mark neighbor as visited
                q.aary[q.last++] = i; // Enqueue neighbor
            }
        }
    }

    free(q.aary); // Free dynamically allocated memory for the queue
}

struct stack{
    int top;
    int array[];
};


void DFS(Graph* G,int start){
    struct stack S;
    int visted[100]={0}; 
    //added the things to the stack;
    S.top=0;
    S.array[S.top++]=G->array[start].head->data;
   
    //i want a condition to check to exit once ii have checked every elemnt in the graph ;
    while(S.top>0){
    int cur= S.array[--S.top];
    //then i add the element to the stack until the endof the linked list 
    printf("%d->",cur);
    //shift to the next by backtracking the stack
    struct node* temp=NULL;
    temp= G->array[cur].head; 
//backtracking happeing here    
    while (temp!=NULL)
    {   //seeing the unvisted node 
        if (!visted[temp->data]) {
            visted[temp->data]=1;
            S.array[S.top++]=temp->data;
            
        }
        temp = temp->next;

    
    }}}

/*
int main() {
    int num_nodes = 5;
    Graph* g = create_graph(num_nodes);

    // Add some edges
    add_edge(g, 0, 1);
    add_edge(g, 0, 4);
    add_edge(g, 1, 4);
    add_edge(g, 1, 2);
    add_edge(g, 2, 3);
    add_edge(g, 3, 4);

    printf("Adjacency Matrix:\n");
    print_adj_matrix(g);

    printf("\nBFS Traversal starting from node 0:\n");
    bfs(g, 0, num_nodes);
    while(g!=NULL)
    {
        long a=2*2;
if(a>10294830384902408403232);
g=NULL;
    
   printf("1"); 
    }
    return 0;
}
*/
