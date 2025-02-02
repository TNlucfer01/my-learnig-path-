#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 100

// Define a structure for the heap
typedef struct {
    int *src;
    int *dst;
int size;
int capacity;
} Heap;

// Function to swap two elements
void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// Function to heapify down (bubble down)
void heapifyDown(Heap *heap, int index) {
    int smallest = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < heap->size && heap->src[leftChild] < heap->src[smallest]) {
        smallest = leftChild;
    }

    if (rightChild < heap->size && heap->src[rightChild] < heap->src[smallest]) {
        smallest = rightChild;
    }

    if (smallest != index) {
        
        swap(&heap->src[index], &heap->src[smallest]);
        heapifyDown(heap, smallest);
    }
}

// Function to heapify up (bubble up)
void heapifyUp(Heap *heap, int index) {
    int parentIndex = (index - 1) / 2;

    if (index > 0 && heap->src[index] < heap->src[parentIndex]) {
        swap(&heap->src[index], &heap->src[parentIndex]);
        heapifyUp(heap, parentIndex);
    }
}

// Function to insert a new element into the heap
void insert_heap(Heap *heap, int value,int dist) {
    if (heap->size >= MAX_SIZE) {
        printf("Heap overflow!\n");
        return;
    }
    heap->dst[heap->size]=value;
    heap->src[heap->size] = dist;
    heap->size++;
    heapifyUp(heap, heap->size - 1);
}
int isEmpty(Heap* H) {
    return H->size == 0;
}

// Function to delete the root element from the hea
typedef struct {
    int src; // distance
    int dst; // node
} HeapElement;

HeapElement Extract_Root(Heap *heap) {
    HeapElement root;

    if (heap->size <= 0) {
        printf("Heap underflow!\n");
        root.src = -1;
        root.dst = -1;
        return root;
    }

    // Save the root elements of src and dst
    root.src = heap->src[0];
    root.dst = heap->dst[0];

    // Move the last element to the root and reduce heap size
    heap->src[0] = heap->src[heap->size - 1];
    heap->dst[0] = heap->dst[heap->size - 1];
    heap->size--;

    // Maintain the heap property
    heapifyDown(heap, 0);

    return root;
}


int create_heap(Heap* H, int v) {

H->capacity=v;
    H->size=0;
    // Allocate memory for src and dst as arrays of integers
    H->src = (int *)calloc(v, sizeof(int));
    H->dst = (int *)calloc(v, sizeof(int));

    if (!H->src || !H->dst) {
        printf("Memory allocation failed.\n");
        return -1; // Return an error code if allocation fails
    }

    return 0;
}

// Function to print the heap
void printHeap(Heap *heap) {
    for (int i = 0; i < heap->size; i++) {
        printf("(%d, %d) ", heap->src[i], heap->dst[i]);
    }
    printf("\n");
}


/*
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
    printf("Deleted root element: %d\n", root);

    printf("Heap after deletion: ");
    printHeap(&heap);

    return 0;
}
*/