#include<stdio.h>
#include<stdlib.h>  

#define MAX_SIZE 100

typedef struct {
    
    int array[MAX_SIZE];
    int size;
} Heap;

void swap(void *a, void  *b) {
    void * temp = &a;
    a = &b;
    b = temp;
}

void heapfydown(Heap* heap,int index){
    int largest = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < heap->size && heap->array[leftChild] > heap->array[largest]) {
        largest = leftChild;
    }

    if (rightChild < heap->size && heap->array[rightChild] > heap->array[largest]) {
        largest = rightChild;
    }

    if (largest != index) {
        swap(&heap->array[index], &heap->array[largest]);
        heapfydown(heap, largest);
    }
}