n = int(input())
ans = []
for i in range(n):
    a, b = (
        input().split()
    )  # getting the input form hte user wen the value are seperated by space
    fin = int(a, 2) + int(b, 2)
    ans.append(fin)
a = bin(max(ans))
print(max(ans))
print(a[2:])
