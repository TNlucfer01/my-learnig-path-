#include <stdio.h>
#include <stdlib.h>

typedef struct node1 {
    int data;
    struct node1* next;
} node1;

node1* create_node1() {
    node1* temp = (node1*)malloc(sizeof(node1));
    int data;
    printf("Enter the data to be inserted: ");
    scanf("%d", &data);
    temp->data = data;  // Assigning data to the node1
    temp->next = NULL;
    return temp;
}

void Create_ll(node1** head) {
    if (*head == NULL) {
        *head = create_node1();
    } else {
        node1* temp = *head;
        while (temp->next != NULL) {  // Traverse to the last node1
            temp = temp->next;
        }
        temp->next = create_node1();  // Link the new node1 at the end
    }
}

int isempty(node1* head) {
    if (head == NULL) {
        printf("The list is empty.\n");
        return 1;
    }
    return 0;
}

void display(node1* head) {
    if (isempty(head)) {
        return;
    } else {
        while (head != NULL) {
            printf("->%d", head->data);
            head = head->next;
        }
        printf("\n");
    }
}

void delete(node1** head, int data) {
    if (isempty(*head)) {
        return;
    } else {
        node1* temp = *head;
        node1* prev = NULL;

        if (temp != NULL && temp->data == data) {
            *head = temp->next;  // Changed head
            free(temp);  // Free old head
            return;
        }

        while (temp != NULL && temp->data != data) {
            prev = temp;
            temp = temp->next;
        }

        if (temp == NULL) return;  // If data was not found

        prev->next = temp->next;  // Unlink the node1 from linked list
        free(temp);  // Free memory
    }
}

int search(node1* head, int key) {
    if (isempty(head)) {
        return -1;
    } else {
        int index = 0;
        while (head != NULL) {
            if (head->data == key) {
                printf("The data is present in the linked list at position %d.\n", index);
                return index;
            }
            head = head->next;
            index++;
        }
        printf("Data not found in the list.\n");
        return -1;
    }
}

/*int main() {
    int i = 0;
    node1* head = NULL;
    while (i < 5) {
        Create_ll(&head);
        i++;
    }
    display(head);
    search(head, 2);
    delete(&head, 2);
    search(head, 2);
    display(head);

    return 0;
}*/
