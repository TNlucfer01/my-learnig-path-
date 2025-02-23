# Define the Node class for the Binary Search Tree
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key

# Function to insert a new node in the BST
def insert(root, key):
    # If the tree is empty, return a new node
    if root is None:
        return Node(key)
    # Otherwise, recur down the tree
    if key < root.val:
        root.left = insert(root.left, key)
    elif key > root.val:
        root.right = insert(root.right, key)
    
    # Return the (unchanged) node pointer
    return root

# Inorder traversal of the BST (Left -> Root -> Right)
def inorder_traversal(root):
    if root:
        inorder_traversal(root.left)
        print(root.val, end=" ")
        inorder_traversal(root.right)

# Postorder traversal of the BST (Left -> Right -> Root)
def postorder_traversal(root):
    if root:
        postorder_traversal(root.left)
        postorder_traversal(root.right)
        print(root.val, end=" ")

# Driver code
if __name__ == "__main__":
    # Initial empty BST
    root = None

    # Input number of child nodes
    print("Enter number of child nodes: ", end="")
    n = int(input())

    # Input child nodes
    for i in range(n):
        print(f"Enter value for child{i+1}: ", end="")
        val = int(input())
        root = insert(root, val)

    print("\nInorder Traversal (Left -> Root -> Right):")
    inorder_traversal(root)
    
    print("\n\nPostorder Traversal (Left -> Right -> Root):")
    postorder_traversal(root)
