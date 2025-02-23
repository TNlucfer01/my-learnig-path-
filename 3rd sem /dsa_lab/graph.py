
class adjNode:
    def __init__(self,data):
        self.vertex=data
        self.next=None
    
class Graph:
    def __init__(self,vertices):
        self.V=vertices
        self.graph=[None]*self.V
    def add_edge(self,src,des):
        node=adjNode(des)
        node.next=self.graph[src]
        self.graph[src]=node

        node=adjNode(src)
        node.next=self.graph[des]
        self.graph[des]=node

    def prints(self):
        for i in range(self.V):
            print("adjacency list of vertex {}\n head".format(i),end="")
            temp=self.graph[i]
            while temp:
                print("->{}".format(temp.vertex),end="") 
                temp=temp.next
            print("\n")
        
V=5
graph=Graph(V)
graph.add_edge(0,1)

graph.add_edge(0,4)
graph.add_edge(1,2)
graph.add_edge(1,3)
graph.add_edge(1,4)
graph.add_edge(2,3)
graph.add_edge(3,4)

graph.prints()
