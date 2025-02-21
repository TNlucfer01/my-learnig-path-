class node:
    def __init__(self,data):
        self.data=data
        self.left=None
        self.right=None
        self.hieght=0


class avlTree:
    def __init__(self):
        self.root=None
        
    def get_height(self,node):
        return node.height
    def balancefactor(self):
        return (self.root.left-self.root.right)
    def max_height(self,A,B):
            return (lambda A,B: A if A>B else B)(A=A,B=B)
    def isEmpty(self):
         return (self.root==None)
    def insert(self,data):
    
    
        new=node(data)
        if(self.data==None):
              self.root=new
        elif(data>self.root.right.data):
             self.root.right=self.insert(data)
        elif(data<self.root.left.data):
             self.root.left=self.insert(data)
        

             