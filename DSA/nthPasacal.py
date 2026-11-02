rowIndex = 10

# if(rowIndex==1):
#     return [1]
# if(rowIndex==2):
#     return [1,1]
list1 = []
current = []
if rowIndex > 2:
    list1.append([1, 1])
for i in range(3, rowIndex):
    storage = []
    for j in range(len(list1) - 1):
        storage.append(list1[j] + list1[j + 1])
        print("storage is ", storage)
    current.append(1)
    current = current + storage
    current.append(1)
    list1 = current
