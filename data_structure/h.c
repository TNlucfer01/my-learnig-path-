#include<stdio.h>
#include"graph.h"


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
