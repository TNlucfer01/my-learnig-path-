#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include<math.h>
#define MAX_NODES 1000

// Structure to represent an edge in the graph
typedef struct Edge {
    int dest;
    int weight;
    struct Edge *next;
} Edge;

// Structure to represent an adjacency list node
typedef struct GraphNode {
    Edge *head;
} GraphNode;

// Structure to represent a graph
typedef struct Graph {
    int numVertices;
    GraphNode *array;
} Graph;

// Min-Heap for Dijkstra's Algorithm
typedef struct {
    int *dist;
    int *vertex;
    int size;
} MinHeap;

// Function to create a new graph with `numVertices` vertices
Graph *createGraph(int numVertices) {
    Graph *graph = (Graph *)malloc(sizeof(Graph));
    graph->numVertices = numVertices;
    graph->array = (GraphNode *)malloc(numVertices * sizeof(GraphNode));

    for (int i = 0; i < numVertices; i++) {
        graph->array[i].head = NULL;
    }

    return graph;
}

// Function to add an edge to the graph
void addEdge(Graph *graph, int src, int dest, int weight) {
    Edge *newEdge = (Edge *)malloc(sizeof(Edge));
    newEdge->dest = dest;
    newEdge->weight = weight;
    newEdge->next = graph->array[src].head;
    graph->array[src].head = newEdge;
}

// Function to create a MinHeap
MinHeap *createMinHeap(int capacity) {
    MinHeap *minHeap = (MinHeap *)malloc(sizeof(MinHeap));
    minHeap->dist = (int *)malloc(capacity * sizeof(int));
    minHeap->vertex = (int *)malloc(capacity * sizeof(int));
    minHeap->size = 0;
    return minHeap;
}

// Swap function for MinHeap
void swap(MinHeap *heap, int i, int j) {
    int tempDist = heap->dist[i];
    int tempVertex = heap->vertex[i];
    heap->dist[i] = heap->dist[j];
    heap->vertex[i] = heap->vertex[j];
    heap->dist[j] = tempDist;
    heap->vertex[j] = tempVertex;
}

// Function to heapify down
void heapifyDown(MinHeap *heap, int index) {
    int smallest = index;
    int left = 2 * index + 1;
    int right = 2 * index + 2;

    if (left < heap->size && heap->dist[left] < heap->dist[smallest])
        smallest = left;

    if (right < heap->size && heap->dist[right] < heap->dist[smallest])
        smallest = right;

    if (smallest != index) {
        swap(heap, index, smallest);
        heapifyDown(heap, smallest);
    }
}

// Function to insert a new element into the min-heap
void insertHeap(MinHeap *heap, int vertex, int distance) {
    int i = heap->size++;

    heap->dist[i] = distance;
    heap->vertex[i] = vertex;

    // Heapify up
    while (i > 0 && heap->dist[i] < heap->dist[(i - 1) / 2]) {
        swap(heap, i, (i - 1) / 2);
        i = (i - 1) / 2;
    }
}

// Function to extract the minimum element from the min-heap
int extractMin(MinHeap *heap, int *minDist) {
    if (heap->size <= 0)
        return -1;

    *minDist = heap->dist[0];
    int minVertex = heap->vertex[0];

    heap->dist[0] = heap->dist[--heap->size];
    heap->vertex[0] = heap->vertex[heap->size];

    heapifyDown(heap, 0);
    return minVertex;
}

// Dijkstra's algorithm implementation
void dijkstra(Graph *graph, int src) {
Node* temp;
    int numVertices = graph->numVertices;
    //for the noting the distance of each nodes and also the visited nodes
    int dist[MAX_NODES];
    int visited[MAX_NODES] = {0};

    // Initialize distances
    for (int i = 0; i < numVertices; i++) {
        dist[i] = INT_MAX;
    }
   
    dist[src] = 0;

// Create a min-heap
    MinHeap *minHeap = createMinHeap(numVertices);
// insertyin f the node and the distance
    insertHeap(minHeap, src, dist[src]);

    while (minHeap->size > 0) {
        
        //to store the current vertex and als its distance 
        int minDist;
        int u = extractMin(minHeap, &minDist);
    // to skip for the visted iteration 
        if (visited[u])
            continue;

        visited[u] = 1;

        // Update distances for each neighbor of u
        
        Edge *edge = graph->array[u].head;
        while (edge != NULL) {
            int v = edge->dest;
            int weight = edge->weight;
//last condition is to select the shortest path 

            if (!visited[v] && dist[u] != INT_MAX && dist[u] + weight < dist[v]) {
                dist[v] = dist[u] + weight;

                insertHeap(minHeap, v, dist[v]);
            }
            edge = edge->next;
        }
    }

    // Print the shortest distances
    printf("Vertex   Distance from Source\n");
    for (int i = 0; i < numVertices; i++) {
        printf("%d \t\t %d\n", i, dist[i]);
    }

    free(minHeap->dist);
    free(minHeap->vertex);
    free(minHeap);
}
typedef struct node{
    int src;
    int dis;
}
Node;

int main() {
    int numVertices = 5;
    Graph *graph = createGraph(numVertices);

    addEdge(graph, 0, 1, 10);
    addEdge(graph, 0, 4, 5);
    addEdge(graph, 1, 2, 1);
    addEdge(graph, 4, 1, 3);
    addEdge(graph, 4, 2, 9);
    addEdge(graph, 4, 3, 2);
    addEdge(graph, 2, 3, 4);
    addEdge(graph, 3, 0, 7);
    addEdge(graph, 2, 0, 2);
    addEdge(graph, 1, 3, 8);
    addEdge(graph, 3, 1, 2);
    addEdge(graph, 2, 4, 6);
    addEdge(graph, 0, 2, 4);
    addEdge(graph, 1, 4, 6);
    addEdge(graph, 3, 4, 3);
    addEdge(graph, 2, 1, 8);
    addEdge(graph, 0, 3, 9);
    addEdge(graph, 1, 0, 7);
    addEdge(graph, 3, 2, 5);
    addEdge(graph, 4, 0, 1);
    addEdge(graph, 2, 3, 7);
    addEdge(graph, 1, 2, 5);
    addEdge(graph,2,4,1); 

    int source = 0;
    printf("Dijkstra's Algorithm starting from node %d:\n", source);
    dijkstra(graph, source);

    // Free memory for graph edges
    for (int i = 0; i < numVertices; i++) {
        Edge *edge = graph->array[i].head;
        while (edge != NULL) {
            Edge *temp = edge;
            edge = edge->next;
            free(temp);
        }
    }
    free(graph->array);
    free(graph);

    return 0;
}
