#include <stdio.h>
#include <stdlib.h>

// Define the structure for a BST node.
typedef struct Node {
    int data;
    struct Node *left;
    struct Node *right;
} Node;

// Function to create a new node.
Node* create_node(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if(newNode == NULL) {
        printf("Memory allocation error\n");
        exit(1);
    }
    newNode->data = data;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// Function to add a node to the BST.
Node* add_node(Node* root, int data) {
    if (root == NULL)
        return create_node(data);
    if (data < root->data)
        root->left = add_node(root->left, data);
    else if (data > root->data)
        root->right = add_node(root->right, data);
    // If data equals root->data, you can decide whether to allow duplicates.
    return root;
}

// Function to search for a node in the BST.
Node* search(Node* root, int key) {
    if (root == NULL || root->data == key)
        return root;
    if (key < root->data)
        return search(root->left, key);
    else
        return search(root->right, key);
}

// Helper function: find the leftmost node (inorder successor) in a tree.
Node* leftSuccessor(Node* root) {
    Node* current = root;
    while (current && current->left != NULL)
        current = current->left;
    return current;
}

// Function to delete a node with given data from the BST.
Node* deleteNode(Node* root, int data) {
    if (root == NULL)
        return root;
    
    if (data < root->data)
        root->left = deleteNode(root->left, data);
    else if (data > root->data)
        root->right = deleteNode(root->right, data);
    else {
        // Node with the data found
        // Case 1: No child or only one child.
        if (root->left == NULL) {
            Node* temp = root->right;
            free(root);
            return temp;
        }
        else if (root->right == NULL) {
            Node* temp = root->left;
            free(root);
            return temp;
        }
        // Case 2: Node has two children.
        // Find inorder successor (smallest in the right subtree).
        Node* temp = leftSuccessor(root->right);
        // Copy the inorder successor's data to this node.
        root->data = temp->data;
        // Delete the inorder successor.
        root->right = deleteNode(root->right, temp->data);
    }
    return root;
}

// Function to perform an inorder traversal of the BST.
void inorder(Node* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
    }
}

int main() {
    Node* root = NULL;
    int choice, data, key;

    printf("Welcome to the BST Program by Lucy!\n");

    while(1) {
        printf("\n====== Menu ======\n");
        printf("1. Insert Node\n");
        printf("2. Delete Node\n");
        printf("3. Search Node\n");
        printf("4. Inorder Traversal\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1:
                printf("Enter data to insert: ");
                scanf("%d", &data);
                root = add_node(root, data);
                printf("%d inserted successfully.\n", data);
                break;
            case 2:
                printf("Enter data to delete: ");
                scanf("%d", &data);
                root = deleteNode(root, data);
                printf("%d deleted (if it existed).\n", data);
                break;
            case 3:
                printf("Enter data to search: ");
                scanf("%d", &key);
                if(search(root, key) != NULL)
                    printf("Data %d found in the tree.\n", key);
                else
                    printf("Data %d not found in the tree.\n", key);
                break;
            case 4:
                printf("Inorder Traversal: ");
                inorder(root);
                printf("\n");
                break;
            case 5:
                printf("Exiting the program. Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
    return 0;
}
