def linearsearch(alist,key):
    for i in range(len(alist)):
        if alist[i]==key:
            return i
    return -1
#test the function
alist=input("Enter the list of number ")
alist=alist.spilt()
alist=[int(x) for x in alist]
key=int(input("Enter the key "))
index=linearsearch(alist,key)
if index<0:
    print("Element is not present in the list")
else:
    print(f"is present at the index {index}")

