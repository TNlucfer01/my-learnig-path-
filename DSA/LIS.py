nums = [1, 2, 1, 3, 1, 3, 11]
lis = [1] * len(nums)  # new type of input getting
n = int(input())
for i in range(n):
    # i don'tunderstand any of the below question and the tatements at all
    for j in range(i):
        if nums[j] < nums[i]:
            if lis[j] + 1 > lis[i]:
                lis[j] = lis[j] + 1
