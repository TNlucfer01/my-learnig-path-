#include<stdio.h>
#include<stdlib.h>

typedef struct node {
    int data;
    struct node* next;
} Node;

typedef struct queue {
    Node* front;
    Node* rear;
    int size;
} Queue;

Queue* createQueue() {
    Queue* q = (Queue*)malloc(sizeof(Queue));
    q->front = q->rear = NULL;
    q->size = 0;
    return q;
}

void enqueue(int data, Queue* q) {
    Node* temp = (Node*)malloc(sizeof(Node));
    temp->data = data;
    temp->next = NULL;
    
    if (q->rear == NULL) {
        q->front = q->rear = temp;
    } else {
        q->rear->next = temp;
        q->rear = temp;
    }
    
    q->size++;
}

int dequeue(Queue* q) {
    if (q->front == NULL) {
        printf("The queue is empty\n");
        return -1;
    }
    
    Node* temp = q->front;
    int data = temp->data;
    q->front = q->front->next;
    
    if (q->front == NULL) {
        q->rear = NULL;
    }
    
    free(temp);
    q->size--;
    return data;
}

void display(Queue* q) {
    if (q->front == NULL) {
        printf("The queue is empty\n");
        return;
    }
    
    Node* temp = q->front;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    int choice, data;
    Queue* q = createQueue();
    
    do {
        printf("1. Enqueue\n2. Dequeue\n3. Display\n4. Size\n5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch (choice) {
            case 1:
                printf("Enter the data: ");
                scanf("%d", &data);
                enqueue(data, q);
                break;
            case 2:
                data = dequeue(q);
                if (data != -1) {
                    printf("Dequeued data: %d\n", data);
                }
                break;
            case 3:
                display(q);
                break;
            case 4:
                printf("Current size: %d\n", q->size);
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
