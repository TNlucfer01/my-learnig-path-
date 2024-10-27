from typing import Any


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
        if(self.left is not None):
            self.left.display()
        print(self.data)
        if(self.right is not None):
            self.right.display()


print("enter root value ")
obj=node(int(input()))
ch=0
while(ch<4):
    print("1.insert 2.display  3.exit")
    ch=int(input())
    if(ch==1):
        print("enter the value to insert ")
        element=int(input())
        obj.insert(element)
    elif(ch==2):
        print("depth first search");
        obj.display()
    else:
        break
    

