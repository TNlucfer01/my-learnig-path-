#include<stdio.h>
#include<stdlib.h>

typedef struct node{
    int data;
    struct node* next;
} Node;

int size = 0;

Node* push(int data, Node** stack) {
    Node* temp = (Node*)malloc(sizeof(Node));
    temp->data = data;
    temp->next = (*stack);
    (*stack) = temp;
    size++;
    return temp;
}

int pop(Node** stack) {
    if ((*stack) == NULL) {
        printf("The stack is empty\n");
        return -1;
    } else {
        int data = (*stack)->data;
        Node* temp = *stack;
        *stack = (*stack)->next;
        free(temp);
        size--;
        return data;
    }
}

void display(Node* stack) {
    if (stack == NULL) {
        printf("The stack is empty\n");
        return;
    }
    Node* temp = stack;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    int choice, data;
    Node* stack = NULL;
    do {
        printf("1. Push\n2. Pop\n3. Display\n4. Size\n5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        switch (choice) {
            case 1:
                printf("Enter the data: ");
                scanf("%d", &data);
                push(data, &stack);
                break;
            case 2:
                data = pop(&stack);
                if (data != -1)
                    printf("Popped data: %d\n", data);
                break;
            case 3:
                display(stack);
                break;
            case 4:
                printf("Current size: %d\n", size);
                break;
            case 5:
                exit(0);
            default:
                printf("Enter a valid choice\n");
                break;
        }
    } while (choice != 5);

    return 0;
}
