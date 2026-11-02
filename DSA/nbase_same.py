def all_digi_same(m, b):
    digits = []
    temp = m
    while temp > 0:
        digits.append(temp % b)
        temp //= b
    return len(set(digits)) == 1


m = int(input())

min_base = 3
while min_base < m:
    ans = all_digi_same(m, min_base)
    if ans:
        break
    else:
        min_base += 1


print(min_base)
