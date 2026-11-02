monsters_count = int(input())
exp = int(input())

monsterexp = [
    int(input()) for _ in range(monsters_count)
]  # a new wway to take input from the use when the user inputs in line by line
monsterbonus = [int(input()) for _ in range(monsters_count)]


a = sorted(
    zip(monsterexp, monsterbonus)
)  # to bundle the value as one and ten sacee te resyt in the list
ans = 0
for power, bonus in a:
    if exp < power:
        pass
    else:
        exp += bonus
        ans += 1

print(ans)
