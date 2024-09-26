def Display_hash(hashTable ):
    for i in range(len(hashTable)):
        print(i,end=" ")
        for j in hashTable[i]:
            print("->",end=" ")
            print(j,end=" ")
        print()
hashTable =[[] for x in range(10)]
def hashing(key_value):
    return key_value%len(hashTable) 

def insert(hashtable,key_value,value):
    hash_key=hashing(key_value)
    hashTable[hash_key].append(value)

insert(hashTable, 10, "allahabad")
insert(hashTable, 25, "mumbai")
insert(hashTable, 20, "mathura")
insert(hashTable, 9, "delhi")
insert(hashTable, 2, "punjab")
insert(hashTable, 2, "noida")
Display_hash(hashTable)
           
            