#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include<string.h>
typedef struct {
char city_name[100];
}Hashtable;
// Define the Graph structure
typedef struct {
    int **matrix;
    int capacity;
    Hashtable* city;
} Graph;

 
 
// Function to create a graph
Graph* create_graph(int capacity) {
    Graph* graph = (Graph*)malloc(sizeof(Graph));
    graph->capacity = capacity;
    graph->matrix = (int**)malloc(capacity * sizeof(int*));
    graph->city = (Hashtable*)malloc(capacity * sizeof(Hashtable));
    for (int i = 0; i < capacity; i++) {
        graph->matrix[i] = (int*)malloc(capacity * sizeof(int));
        for (int j = 0; j < capacity; j++) {
            graph->matrix[i][j] = 0;
        }
    }
    return graph;
}

void add_city(Graph* map, int index, char* name) {
    if(index < 0 || index >= map->capacity){
        printf("Invalid city index\n");
        return;
    }
    strcpy(map->city[index].city_name, name);
}

void print_citys(Graph* map) {
    if (map->city == NULL)
    {
        printf("No citys added\n");
        return;
        /* code */
    }
    for (int i = 0; i < map->capacity; i++)
        printf("%s\n", map->city[i].city_name);
}


// Function to delete a city (remove all edges to/from it)
void delete_city(Graph* map, int src) {
    for (int i = 0; i < map->capacity; i++) {
        map->matrix[src][i] = -1; // Remove the outgoing edges from src
        map->matrix[i][src] = -1; // Remove the incoming edges to src
    }
    printf("City %d and its connections have been removed.\n", src);
}

// Function to find the shortest path using BFS or Dijkstra's algorithm
int find_shortest_path(Graph* map, int src, int dest, int num) {
    int *visited = (int*)calloc(num, sizeof(int));
    int *distance = (int*)malloc(num * sizeof(int));
    if (distance == NULL || visited == NULL) {
        // Handle memory allocation failure
        fprintf(stderr, "Memory allocation failed\n");
        return -1;
    }
    for (int i = 0; i < num; i++) {
        distance[i] = INT_MAX;
    }
    distance[src] = 0;

    // Initialize the queue
    typedef struct {
        int *aary;
        int front, last;
    } Queue;
    Queue q;
    q.aary = (int*)malloc(num * sizeof(int));
    q.front = q.last = 0;
    q.aary[q.last++] = src;

    while (q.front < q.last) {
        // Dequeue a node from the queue
        int node = q.aary[q.front++];
        printf("%d ", node); // Process the node

        // Enqueue neighbors of the node
        for (int i = 0; i < num; i++) {
            // Get distance
            if (map->matrix[node][i] != -1 && !visited[i]) {
                visited[i] = 1; // Mark neighbor as visited
                int new_distance = distance[node] + map->matrix[node][i];
                if (new_distance < distance[i]) {
                    distance[i] = new_distance;
                }
                // Return the distance if destination is reached
                if (i == dest) {
                    free(q.aary); // Free dynamically allocated memory for the queue
                    free(visited);
                    int result = distance[i];
                    free(distance);
                    return result;
                }
                q.aary[q.last++] = i; // Enqueue neighbor
            }
        }
    }
    free(q.aary); // Free dynamically allocated memory for the queue
    free(visited);
    free(distance);
    return -1;
}

int main() {
    int choice, src, des, weight;
    Graph* map = create_graph(5);

    while (1) {
        printf("\nGraph Operations Menu:\n");
        printf("1. Add city\n");
        printf("2. Check distance between cities\n");
        printf("3. Delete city\n");
        printf("4. List of city\n 5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch (choice) {
            case 1:
                printf("Enter source city index (0-4): ");
                scanf("%d", &src);
                printf("Enter city name: ");
                char name[100];
                scanf("%s", name);
                add_city(map,src, name);

                printf("Enter destination city index (0-4): ");
                scanf("%d", &des);
                printf("Eneter the city name: ");
                scanf("%s", name);
                add_city(map,des, name);
                printf("Enter the distance between these cities: ");
                scanf("%d", &weight);
                map->matrix[src][des] = weight;
                map->matrix[des][src] = weight;
                printf("City added: %d <--> %d with distance %d\n", src, des, weight);
                break;
            case 2:
                printf("Enter source city index (0-4): ");
                scanf("%d", &src);
                printf("Enter destination city index (0-4):");
                scanf("%d", &des);
                int distance = find_shortest_path(map, src, des, 5);
                if (distance  >-1) {
                    printf("Shortest distance from city %d to city %d is %d\n", src, des, distance);
                } else {
                    printf("No path found from city %d to city %d\n", src, des);
                }
                break;
            case 3:
                printf("Enter city index to delete (0-4): ");
                scanf("%d", &src);
                delete_city(map, src);
                break;
            case 4:
            printf(" the citys are\n");
            print_citys(map);
                break;
            case 5:
                for (int i = 0; i < map->capacity; i++) {
                    free(map->matrix[i]);
                }
                free(map->matrix);
                free(map);
                return 0;
            default:
                printf("Invalid choice\n");
        }
    }
}
