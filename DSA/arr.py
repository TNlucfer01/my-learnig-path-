arr = ["r", "b", "g", "y", "2"]
target = int(input())
# for i in range(len(arr)):
#     print(arr[(target - i + len(arr)) % len(arr)])
right = 0
left = 0
mini = 0
for i in range(len(arr)):
    if arr[(target - i + len(arr)) % len(arr)] != arr[0]:
        right += 1
    if arr[(target + i) % len(arr)] != arr[0]:
        left += 1
    else:
        break
mini = min(right, left)
print(mini)

#
# n = len(arr)
# max_value = 0
# for start in range(n):
#     res = [arr[(start - i) % n] for i in range(n)]  # power of list compression
#     total = 0
#     ans = 0
#     for i in res:
#         ans ^= i
#         total += ans
#     max_value = max(total, max_value)
#
#     res = [arr[(start + i) % n] for i in range(n)]
#     total = 0
#     ans = 0
#     for i in res:
#         ans ^= i
#         total += ans
#     max_value = max(total, max_value)
#
#
# print(max_value)
