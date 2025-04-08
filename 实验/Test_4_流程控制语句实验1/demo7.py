result = 0
f = 1

for i in range(1, 100, 2):
    result += f * i
    f = -f

print(result)
