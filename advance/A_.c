
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include"/home/darkemperor/aathi/my-learnig-path-/data_structure/graph.h"
#include"/home/darkemperor/aathi/my-learnig-path-/data_structure/mini_heap.h"
//it takes two argument ,first is the soucre node and the second is the destination node 
// the problem how could i find the nodes are same or not




//returns the eucludian value of the current node  
int heuristic(int x,int x1,int y,int y1 ){

}

//returns the cost of the current node

void A_star(int** G,int src,int dest){
    
}

int main(){
    //declare the graph
    Graph* g = create_graph(10);
    add_edge(g,1,2,3);
    add_edge(g,2,3,4);
    add_edge(g,3,4,5);
    add_edge(g,4,5,6);
    add_edge(g,5,6,7);
    add_edge(g,6,7,8);
    add_edge(g,7,8,9);
    add_edge(g,8,9,10);

    print_adj_matrix(g);

}

