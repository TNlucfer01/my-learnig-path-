#include<stdio.h>
#include<stdlib.h>

struct node {
    int data;
    struct node* left;
    struct node* right;
};

// Function to create a new node
struct node* new_node(int data) {
    struct node* temp = (struct node*)malloc(sizeof(struct node));
    temp->data = data;
    temp->left = NULL;
    temp->right = NULL;
    return temp;
}

// Insert function
struct node* insert(struct node* tree, int data) {
    if (tree == NULL) {
        return new_node(data);
    }
    if (data < tree->data) {
        tree->left = insert(tree->left, data);
    } else if (data > tree->data) {
        tree->right = insert(tree->right, data);
    }
    return tree;
}

// Search function
struct node* search(struct node* tree, int data) {
    if (tree == NULL || tree->data == data) {
        return tree;
    }
    if (data < tree->data) {
        return search(tree->left, data);
    } else {
        return search(tree->right, data);
    }
}

// Check if the tree is empty
int isEmpty(struct node* tree) {
    return tree == NULL;
}

// Function to find the leftmost successor
struct node* left_successor(struct node* tree) {
    struct node* current = tree;
    while (current && current->left != NULL) {
        current = current->left;
    }
    return current;
}

// Swap data between two nodes
void swap_data(struct node* a, struct node* b) {
    int temp = a->data;
    a->data = b->data;
    b->data = temp;
}

// Delete function
struct node* delete(struct node* tree, int data) {
    if (isEmpty(tree)) {
        printf("The tree is empty.\n");
        return tree;
    }

    if (data < tree->data) {
        tree->left = delete(tree->left, data);
    } else if (data > tree->data) {
        tree->right = delete(tree->right, data);
    } else {
        // Node with only one child or no child
        if (tree->left == NULL) {
            struct node* temp = tree->right;
            free(tree);
            return temp;
        } else if (tree->right == NULL) {
            struct node* temp = tree->left;
            free(tree);
            return temp;
        }

        // Node with two children: Get the inorder successor (smallest in the right subtree)
        struct node* temp = left_successor(tree->right);

        // Copy the inorder successor's content to this node
        tree->data = temp->data;

        // Delete the inorder successor
        tree->right = delete(tree->right, temp->data);
    }
    return tree;
}

// Inorder traversal function
void inorder(struct node* tree) {
    if (tree != NULL) {
        inorder(tree->left);
        printf("%d ", tree->data);
        inorder(tree->right);
    }
}

int main() {
    struct node* root = NULL;
    root = insert(root, 50);
    root = insert(root, 30);
    root = insert(root, 20);
    root = insert(root, 40);
    root = insert(root, 70);
    root = insert(root, 60);
    root = insert(root, 80);

    printf("Inorder traversal: ");
    inorder(root);
    printf("\n");

    printf("Deleting 20\n");
    root = delete(root, 20);
    printf("Inorder traversal: ");
    inorder(root);
    printf("\n");

    printf("Deleting 30\n");
    root = delete(root, 30);
    printf("Inorder traversal: ");
    inorder(root);
    printf("\n");

    printf("Deleting 50\n");
    root = delete(root, 50);
    printf("Inorder traversal: ");
    inorder(root);
    printf("\n");

    return 0;
}
