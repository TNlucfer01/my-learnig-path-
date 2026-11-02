a = input()
b = input()
c = input()
if a > b:
    if a > c:
        print(f"{a} is greatest")
elif b > a:
    if b > c:
        print(f"{b} is greatest")
else:
    print(f"{c} is greatest")
