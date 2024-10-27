stack=None
class node:
    def __init__(self,data):
        self.data=data
        self.left=None
        self.right=None

    def insert(self,data):
        if(self.data<data):
            if(self.right==None):
                self.right=node(data)
            else:
                self.left.insert(data)
    
    def display(self):
      
        print(self.data)
        if(self.left is not None):
            stack.append(self.left)
        if(self.right is not None):
            stack.append(self.right)
        if(stack):
            temp=stack
            del(stack[0])
            temp.display()


print(" enter")


