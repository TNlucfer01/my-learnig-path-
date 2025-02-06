#include<stdio.h>
#include<stdlib.h>

// Define the structure for the AVL tree nodes
struct node {
    int data;           // Node's data
    struct node* left;  // Pointer to the left child
    struct node* right; // Pointer to the right child
    int height;         // Height of the node
};
    cvjkd 
    
// Function prototypes
struct node* create_node(int data);
int get_height(struct node* n);
int get_balance(struct node* root);
int max_height(int a, int b);
struct node* insert(struct node* root, int data);
struct node* left_rotation(struct node* x);
struct node* right_rotation(struct node* y);
void inOrder(struct node* root);

// Function to create a new node with given data
// Initializes the left and right pointers to NULL and height to 1
struct node* create_node(int data) {
    struct node* temp = (struct node*)malloc(sizeof(struct node));
    temp->data = data;
    temp->left = temp->right = NULL;
    temp->height = 1; // New node is initially added at leaf (height = 1)
    return temp;
}

// Function to get the height of a node
// Returns 0 if the node is NULL, otherwise returns the node's height
int get_height(struct node* n) {
    if (n == NULL) {
        return 0;
    }
    return n->height;
}

// Function to calculate the balance factor of a node
// Balance factor = height of left subtree - height of right subtree
int get_balance(struct node* root) {
    if (root == NULL) {
        return 0;
    }
    return get_height(root->left) - get_height(root->right);
}

// Function to get the maximum of two integers
int max_height(int a, int b) {
    return (a > b) ? a : b;
}

// Function to perform right rotation on a subtree rooted with y
// Right rotation is used when the left subtree is too tall
struct node* right_rotation(struct node* y) {
    struct node* x = y->left;
    struct node* T2 = x->right;

    // Perform rotation
    x->right = y;
    y->left = T2;

    // Update heights of the rotated nodes
    y->height = max_height(get_height(y->left), get_height(y->right)) + 1;
    x->height = max_height(get_height(x->left), get_height(x->right)) + 1;

    // Return the new root after rotation
    return x;
}

// Function to perform left rotation on a subtree rooted with x
// Left rotation is used when the right subtree is too tall
struct node* left_rotation(struct node* x) {
    struct node* y = x->right;
    struct node* T2 = y->left;

    // Perform rotation
    y->left = x;
    x->right = T2;

    // Update heights of the rotated nodes
    x->height = max_height(get_height(x->left), get_height(x->right)) + 1;
    y->height = max_height(get_height(y->left), get_height(y->right)) + 1;

    // Return the new root after rotation
    return y;
}
//to get the left successor of the root 
struct node* left_successor(struct node* tree) {
    struct node* current = tree;
    while (current && current->left != NULL) {
        current = current->left;
    }
    return current;
}

//to swap  
void swap_data(struct node* a, struct node* b) {
    int temp = a->data;
    a->data = b->data;
    b->data = temp;
}


// Function to insert a new node with given data in the AVL tree
// Inserts the node like in a regular BST, then checks and fixes any imbalance
struct node* insert(struct node* root, int data) {
    // 1. Perform the normal BST insertion
    if (root == NULL)
        return create_node(data);

    if (data < root->data)
        root->left = insert(root->left, data);
    else if (data > root->data)
        root->right = insert(root->right, data);
    else // Equal keys are not allowed in BST
        return root;

    // 2. Update height of this ancestor node
    root->height = 1 + max_height(get_height(root->left), get_height(root->right));

    // 3. Get the balance factor of this node to check whether this node became unbalanced
    int balance = get_balance(root);

    // 4. If the node becomes unbalanced, there are 4 cases:

    // Left Left Case
    if (balance > 1 && data < root->left->data)
        return right_rotation(root);

    // Right Right Case
    if (balance < -1 && data > root->right->data)
        return left_rotation(root);

    // Left Right Case
    if (balance > 1 && data > root->left->data) {
        root->left = left_rotation(root->left);
        return right_rotation(root);
    }

    // Right Left Case
    if (balance < -1 && data < root->right->data) {
        root->right = right_rotation(root->right);
        return left_rotation(root);
    }

    // Return the (unchanged) node pointer
    return root;
}

// Function to perform in-order traversal of the AVL tree
// This will print the nodes in ascending order
void inOrder(struct node* root) {
    if (root != NULL) {
        inOrder(root->left);
        printf("%d ", root->data);
        inOrder(root->right);
    }
}


// Function to search for a node with a given data in the AVL tree
// Returns 1 if the data is found, 0 otherwise
int search(struct node* root, int data) {
    if (root == NULL) {
        return 0; // Data not found
    }

    // Search in the left subtree
    if (data < root->data) {
        return search(root->left, data);
    }
    // Search in the right subtree
    else if (data > root->data) {
        return search(root->right, data);
    }
    // Data is found
    else {
        return 1;
    }
}

// Function to delete a node from the AVL tree
// Handles rebalancing of the tree after deletion
struct node* delete(struct node* root, int data) {
    // Perform standard BST delete
    if (root == NULL)
        return root;

    if (data < root->data) {
        root->left = delete(root->left, data);
    } else if (data > root->data) {
        root->right = delete(root->right, data);
    } else {
        // Node with only one child or no child
        if ((root->left == NULL) || (root->right == NULL)) {
            struct node* temp = root->left ? root->left : root->right;

            // No child case
            if (temp == NULL) {
                temp = root;
                root = NULL;
            } else { // One child case
                *root = *temp;
            }
            free(temp);
        } else {
            // Node with two children: Get the inorder successor
            struct node* temp = left_successor(root->right);

            // Copy the inorder successor's data to this node
            root->data = temp->data;

            // Delete the inorder successor
            root->right = delete(root->right, temp->data);
        }
    }

    // If the tree had only one node then return
    if (root == NULL)
        return root;

    // Update height of the current node
    root->height = 1 + max_height(get_height(root->left), get_height(root->right));

    // Get the balance factor of this node
    int balance = get_balance(root);

    // If the node becomes unbalanced, there are 4 cases:

    // Left Left Case
    if (balance > 1 && get_balance(root->left) >= 0)
        return right_rotation(root);

    // Left Right Case
    if (balance > 1 && get_balance(root->left) < 0) {
        root->left = left_rotation(root->left);
        return right_rotation(root);
    }

    // Right Right Case
    if (balance < -1 && get_balance(root->right) <= 0)
        return left_rotation(root);

    // Right Left Case
    if (balance < -1 && get_balance(root->right) > 0) {
        root->right = right_rotation(root->right);
        return left_rotation(root);
    }

    return root;
}

int main() {
    struct node* root = NULL;

    // Inserting nodes into the AVL tree
    root = insert(root, 10);
    root = insert(root, 20);
    root = insert(root, 30);
    root = insert(root, 40);
    root = insert(root, 50);
    root = insert(root, 25);
     int s= search (root,10);
     root= delete(root,10);
    // Printing the in-order traversal of the AVL tree
    if(s==1) printf(" the data is found");
    else printf("' not found ");
    printf("Inorder traversal of the constructed AVL tree is:\n");
    inOrder(root);

    return 0;
}
