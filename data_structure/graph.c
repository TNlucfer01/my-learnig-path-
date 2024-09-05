#include<stdlib.h>
#include<stdio.h>
#include<stdbool.h>

struct node{
    struct node* next;
    int data;
};

struct adjlist{
    struct node* head;
};

typedef struct Graph {
    struct adjlist* array ;
    int v;
    int aar[10][10]; // Adjacency matrix
}Graph;

// Function to create a new node
struct node* create_node(int data) {
    struct node* temp = (struct node* )malloc(sizeof(struct node));
    temp->data = data;
    temp->next = NULL;
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
void add_edge(Graph* g, int src, int des) {
    // Add from src to des (adjacency list)
    struct node* new = create_node(des);
    new->next = g->array[src].head;
    g->array[src].head = new;
    g->aar[des][src] = 1;

    // Add from des to src (adjacency list)
    new = create_node(src);
    new->next = g->array[des].head;
    g->array[des].head = new;
    g->aar[src][des] = 1;
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
    if (g == NULL) {
        printf("The graph is empty\n");
        return;
    }
    for (int i = 0; i < g->v; i++) {
        for (int j = 0; j < g->v; j++) {
            printf("%d ", g->aar[i][j]);
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

    return 0;
}
