def childnodes(i):
    return (2 * i) + 1, (2 * i) + 2

def traversal(a, i=0, d=0):
    if i >= len(a):
        return
    l, r = childnodes(i)
    traversal(a, r, d + 1)
    print(" " * d + str(a[i]))
    traversal(a, l, d + 1)

a = []
r = int(input("Enter root value: "))
a.append(r)

i = int(input("Enter the number of child nodes: "))
for c in range(i):
    c = int(input("Enter child value: ")) 
    a.append(c)

a.sort()

print("\nTREE representation in MIN heap:")
traversal(a)

a.reverse()

print("\nTREE representation in MAX heap:")
traversal(a)
