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

# Driver code
if __name__ == "__main__":
    # Initial empty BST
    root = None
    
    # Insert nodes to the BST
    nodes = [50, 30, 20, 40, 70, 60, 80]
    for node in nodes:
        root = insert(root, node)

    print("Inorder traversal of the BST")
    inorder_traversal(root)
