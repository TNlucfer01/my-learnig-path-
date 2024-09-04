#include <stdio.h>
#include <stdlib.h>

// Define colors for Red-Black Tree nodes
#define RED 1
#define BLACK 0

// Structure for the tree node
struct node {
    int data;
    int color;
    struct node *left, *right, *parent;
};

// Function to create a new Red-Black Tree node
struct node* create_node(int data) {
    struct node* newNode = (struct node*)malloc(sizeof(struct node));
    newNode->data = data;
    newNode->color = RED;  // New nodes are always red initially
    newNode->left = newNode->right = newNode->parent = NULL;
    return newNode;
}

// Function to perform a left rotation
void left_rotate(struct node **root, struct node *x) {
    struct node *y = x->right;
    x->right = y->left;
    if (y->left != NULL) {
        y->left->parent = x;
    }
    y->parent = x->parent;
    if (x->parent == NULL) {
        *root = y;
    } else if (x == x->parent->left) {
        x->parent->left = y;
    } else {
        x->parent->right = y;
    }
    y->left = x;
    x->parent = y;
}

// Function to perform a right rotation
void right_rotate(struct node **root, struct node *y) {
    struct node *x = y->left;
    y->left = x->right;
    if (x->right != NULL) {
        x->right->parent = y;
    }
    x->parent = y->parent;
    if (y->parent == NULL) {
        *root = x;
    } else if (y == y->parent->right) {
        y->parent->right = x;
    } else {
        y->parent->left = x;
    }
    x->right = y;
    y->parent = x;
}

// Function to fix violations after insertion
void rbInsertFixup(struct node **root, struct node *z) {
    while (z->parent != NULL && z->parent->color == RED) {
        if (z->parent == z->parent->parent->left) {
            struct node *y = z->parent->parent->right;  // Uncle of z
            if (y != NULL && y->color == RED) {  // Case 1: Uncle is red
                z->parent->color = BLACK;
                y->color = BLACK;
                z->parent->parent->color = RED;
                z = z->parent->parent;
            } else {
                if (z == z->parent->right) {  // Case 2: z is a right child
                    z = z->parent;
                    left_rotate(root, z);
                }
                // Case 3: z is a left child
                z->parent->color = BLACK;
                z->parent->parent->color = RED;
                right_rotate(root, z->parent->parent);
            }
        } else {  // Mirror case for when z's parent is a right child
            struct node *y = z->parent->parent->left;  // Uncle of z
            if (y != NULL && y->color == RED) {  // Case 1: Uncle is red
                z->parent->color = BLACK;
                y->color = BLACK;
                z->parent->parent->color = RED;
                z = z->parent->parent;
            } else {
                if (z == z->parent->left) {  // Case 2: z is a left child
                    z = z->parent;
                    right_rotate(root, z);
                }
                // Case 3: z is a right child
                z->parent->color = BLACK;
                z->parent->parent->color = RED;
                left_rotate(root, z->parent->parent);
            }
        }
    }
    (*root)->color = BLACK;  // Ensure the root is always black
}

// Function to insert a new node into the Red-Black Tree
void rbInsert(struct node **root, int data) {
    struct node *z = create_node(data);
    struct node *y = NULL;
    struct node *x = *root;

    // Standard BST insertion
    while (x != NULL) {
        y = x;
        if (z->data < x->data) {
            x = x->left;
        } else {
            x = x->right;
        }
    }
    z->parent = y;
    if (y == NULL) {
        *root = z;  // Tree was empty
    } else if (z->data < y->data) {
        y->left = z;
    } else {
        y->right = z;
    }

    // Fix violations after insertion
    rbInsertFixup(root, z);
}
// Function to fix violations after deletion
void rbDeleteFixup(struct node **root, struct node *x) {
    while (x != *root && x->color == BLACK) {
        if (x == x->parent->left) {
            struct node *w = x->parent->right;
            if (w->color == RED) {  // Case 1: x's sibling w is red
                w->color = BLACK;
                x->parent->color = RED;
                left_rotate(root, x->parent);
                w = x->parent->right;
            }
            if (w->left->color == BLACK && w->right->color == BLACK) {  // Case 2: both of w's children are black
                w->color = RED;
                x = x->parent;
            } else {
                if (w->right->color == BLACK) {  // Case 3: w's right child is black
                    w->left->color = BLACK;
                    w->color = RED;
                    right_rotate(root, w);
                    w = x->parent->right;
                }
                // Case 4: w's right child is red
                w->color = x->parent->color;
                x->parent->color = BLACK;
                w->right->color = BLACK;
                left_rotate(root, x->parent);
                x = *root;
            }
        } else {  // Mirror case for when x is a right child
            struct node *w = x->parent->left;
            if (w->color == RED) {  // Case 1: x's sibling w is red
                w->color = BLACK;
                x->parent->color = RED;
                right_rotate(root, x->parent);
                w = x->parent->left;
            }
            if (w->left->color == BLACK && w->right->color == BLACK) {  // Case 2: both of w's children are black
                w->color = RED;
                x = x->parent;
            } else {
                if (w->left->color == BLACK) {  // Case 3: w's left child is black
                    w->right->color = BLACK;
                    w->color = RED;
                    left_rotate(root, w);
                    w = x->parent->left;
                }
                // Case 4: w's left child is red
                w->color = x->parent->color;
                x->parent->color = BLACK;
                w->left->color = BLACK;
                right_rotate(root, x->parent);
                x = *root;
            }
        }
    }
    x->color = BLACK;
}

// Function to replace two nodes during deletion
void rbTransplant(struct node **root, struct node *u, struct node *v) {
    if (u->parent == NULL) {
        *root = v;
    } else if (u == u->parent->left) {
        u->parent->left = v;
    } else {
        u->parent->right = v;
    }
    if (v != NULL) {
        v->parent = u->parent;
    }
}

// Function to find the minimum node in the subtree
struct node* treeMinimum(struct node *x) {
    while (x->left != NULL) {
        x = x->left;
    }
    return x;
}

// Function to delete a node from the Red-Black Tree
void rbDelete(struct node **root, struct node *z) {
    struct node *y = z;
    struct node *x;
    int y_original_color = y->color;

    if (z->left == NULL) {
        x = z->right;
        rbTransplant(root, z, z->right);
    } else if (z->right == NULL) {
        x = z->left;
        rbTransplant(root, z, z->left);
    } else {
        y = treeMinimum(z->right);
        y_original_color = y->color;
        x = y->right;
        if (y->parent == z) {
            if (x != NULL) {
                x->parent = y;
            }
        } else {
            rbTransplant(root, y, y->right);
            y->right = z->right;
            y->right->parent = y;
        }
        rbTransplant(root, z, y);
        y->left = z->left;
        y->left->parent = y;
        y->color = z->color;
    }

    if (y_original_color == BLACK) {
        rbDeleteFixup(root, x);
    }

    free(z);  // Free memory for the deleted node
}
