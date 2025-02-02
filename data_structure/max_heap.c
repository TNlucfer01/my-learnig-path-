#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 100

// Define a structure for the heap
typedef struct {
    int array[MAX_SIZE];
    int size;
} Heap;
// Function to swap two elements
void swap(int *a, int  *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// Function to heapify down (bubble down) for a max-heap
void heapifyDown(Heap *heap,int index) {
    int largest = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
//if the left child is greater than the parent
    if (leftChild<heap->size && heap->array[leftChild] > heap->array[largest]) {
        largest = leftChild;
    }
//if the right child is greater than the parent
    if (rightChild < heap->size && heap->array[rightChild] > heap->array[largest]) {
        largest = rightChild;
    }
// if the largest is not the parent
    if (largest != index) {
        swap(&heap->array[index], &heap->array[largest]);
        heapifyDown(heap, largest);
    }
}

// Function to heapify up (bubble up) for a max-heap
void heapifyUp(Heap *heap, int index) {
    int parentIndex = (index - 1) / 2;
//if the parent is less than the child
    if (index > 0 && heap->array[index] > heap->array[parentIndex]) {
        swap(&heap->array[index], &heap->array[parentIndex]);
        heapifyUp(heap, parentIndex);
    }
}

// Function to insert a new element into the heap
void insert(Heap *heap, int value) {
    if (heap->size >= MAX_SIZE) {
        printf("Heap overflow!\n");
        return;
    }

    heap->array[heap->size] = value;
    heap->size++;

    heapifyUp(heap, heap->size - 1);
}

// Function to delete the root element from the heap
int deleteRoot(Heap *heap) {
    if (heap->size <= 0) {
        printf("Heap underflow!\n");
        return -1;
    }

    int root = heap->array[0];
    heap->array[0] = heap->array[heap->size - 1];
    heap->size--;

    heapifyDown(heap, 0);

    return root;
}

// Function to print the heap
void printHeap(Heap *heap) {
    for (int i = 0; i < heap->size; i++) {
        printf("%d ", heap->array[i]);
    }
    printf("\n");
}

int main() {
    Heap heap;
    heap.size = 0;

    // Insert elements into the heap
    insert(&heap, 3);
    insert(&heap, 5);
    insert(&heap, 8);
    insert(&heap, 12);
    insert(&heap, 15);
    insert(&heap, 10);
    insert(&heap, 4);

    printf("Heap after insertions: ");
    printHeap(&heap);

    // Delete the root element
    int root = deleteRoot(&heap);
    printf("Deleted root element: %d\n",root);
    printf("Heap after deletion: ");
    printHeap(&heap);
    return 0;
}
