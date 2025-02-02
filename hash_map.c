#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

struct hash{
    int data;
    char* key;
    struct hash *next;
};

struct hash* table[100];
unsigned int hash(char* key){
    unsigned int hashvalue=0;
    for (int i = 0;i< strlen(key); i++)
    {
        hashvalue+=key[i];
    }
    return (hashvalue%10);
    
}

void insert(char* key,int value){
    int index=hash(key);
    struct hash* new=malloc(sizeof(struct hash));
    strcpy(new->key,key);
    new->data=value;
    new->next=NULL;
    //no colisiion 
    if (table[index]==NULL)
    {
        table[index]=new;
    }
    //when there is collision 

    else{
        struct hash* temp = table[index];
        while (temp!=NULL)
        {
            temp=temp->next;
        }
        temp->next=new;
    }
}



int search(char* key) {
    unsigned int index = hash(key);
    struct hash* temp = table[index];

    // Traverse the list at the index to find the item
    while (temp != NULL) {
        if (strcmp(temp->key, key) == 0) {
            return temp->data;  // Return the value if found
        }
        temp = temp->next;
    }
    return -1;  // Key not found
}

