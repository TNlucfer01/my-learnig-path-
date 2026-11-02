numRows = 5
list1 = []
if numRows > 1:
    list1.append([1])
if numRows > 2:
    list1.append([1, 1])
print(list1)
for i in range(3, numRows + 1):
    curr = []
    temp = list1[i - 2]
    storage = []
    for j in range(len(temp) - 1):
        storage.append(temp[j] + temp[j + 1])

    curr.append(1)
    curr = curr + storage
    curr.append(1)
    list1.append(curr)
print(list1)
