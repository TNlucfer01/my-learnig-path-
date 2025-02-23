def bin(key,alist):
    start=0
    end=len(alist)-1
    while start<=end:
        mid=(start+end)//2
        if(key==alist[mid]):
            return mid
        elif(key<alist[mid]):
            end=mid-1
        else:
            start=mid+1



alist =[1,2,3,4,5,6]
print(alist)
key = int(input("enter thhe search key"))
i= bin(key,alist)

if i<0:
    print(" key not found")
else:
    print("key found at index",i)  # Output: 3
    