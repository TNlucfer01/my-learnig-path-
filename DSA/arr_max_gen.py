import matplotlib.pyplot as plt

n = int(input())
a = [0] * n
aa = [10] * n
print(aa)
a[0] = 0
a[1] = 1
for i in range(n // 2): 
    a[2 * i] = a[i]
    a[2 * i + 1] = a[i] + a[i + 1]

plt.plot(a)
plt.show()
print(max(a))
