nums = [1, 2, 3, 4, 5, 6]
k = int(input())
n = len(nums)
test = list()
n =len(nums)
test=list()
for i in range(n):
    test.append(nums[(i-k)%n])
nums=test
print(nums)
