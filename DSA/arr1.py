a = list(
    map(int, input().split())
)  # a new way to take a input from user if the user enter the number seprated by space only
count = 0
a.sort()
while len(a) != 0:
    if a[0] != a[-1]:
        a.pop()
        a.pop(0)
    else:
        a.pop()
    count += 1

print(count)
