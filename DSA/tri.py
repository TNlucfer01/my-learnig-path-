triangle = [[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]


for i in range(len(triangle) - 2, -1, -1):
    print("len of the arrayis :", len(triangle) - 2)
    print(triangle[i][0])
    for j in range(len(triangle[i])):
        triangle[i][j] = min(
            (triangle[i + 1][j] + triangle[i][j]),
            triangle[i + 1][j + 1] + triangle[i][j],
        )
print(triangle)
