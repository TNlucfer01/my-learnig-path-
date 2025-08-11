#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int data;
    void* func; // Not used here, but kept
    struct node* next;
} node;

typedef struct linkedList {
    struct node* head;
    struct node* tail;
} linkedList;

// Create a new node with user input
node* create_Node() {
    int data;
    printf("Enter the data to be inserted: ");
    scanf("%d", &data);

    if (data == 0) {
        fprintf(stderr, "Something went wrong\n");
        return NULL;
    }

    node* new_node = calloc(1, sizeof(*new_node));
    if (!new_node) {
        fprintf(stderr, "Memory allocation failed\n");
        return NULL;
    }

    new_node->data = data;
    new_node->func = NULL;
    new_node->next = NULL;
    return new_node;
}

// Insert node into linked list
node* insert_Node(linkedList** ll) {
    node* new_node = create_Node();
    if (!new_node) return NULL;

    if ((*ll)->head == NULL) {
        (*ll)->head = new_node;
        (*ll)->tail = new_node;
    } else {
        (*ll)->tail->next = new_node;
        (*ll)->tail = new_node;
    }

    return new_node;
}

// Search for a node by value
node* search(linkedList** ll, int searchData) {
    linkedList* list = *ll;
    if (list->head == NULL) {
        fprintf(stderr, "The linked list is empty\n");
        return NULL;
    }

    node* temp = list->head;
    while (temp) {
        if (temp->data == searchData) {
            return temp; // Found
        }
        temp = temp->next;
    }

    fprintf(stderr, "The data is not found\n");
    return NULL;
}

// Delete a node by value
int delete_Node(linkedList** ll, int data) {
    linkedList* list = *ll;
    if (list->head == NULL) {
        fprintf(stderr, "The list is empty\n");
        return 0;
    }

    node* temp = list->head;
    node* prev = NULL;

    while (temp) {
        if (temp->data == data) {
            if (prev == NULL) { // Deleting head
                list->head = temp->next;
                if (list->tail == temp) list->tail = NULL; // If only one node
            } else {
                prev->next = temp->next;
                if (list->tail == temp) list->tail = prev;
            }
            free(temp);
            return 1; // Deleted successfully
        }
        prev = temp;
        temp = temp->next;
    }

    fprintf(stderr, "The data is not found\n");
    return 0;
}

// Print list
void print_List(linkedList* ll) {
    node* temp = ll->head;
    printf("Linked List: ");
    while (temp) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    linkedList* list = calloc(1, sizeof(*list));

    insert_Node(&list);
    insert_Node(&list);
    insert_Node(&list);

    print_List(list);

    int searchVal = 5;
    if (search(&list, searchVal)) {
        printf("Value %d found!\n", searchVal);
    }

    delete_Node(&list, searchVal);
    print_List(list);

    return 0;
}
