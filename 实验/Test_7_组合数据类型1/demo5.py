s = [9, 7, 8, 3, 2, 1, 5, 6]

print(f'变换前，s = {s}')

result = []

for i in s:
    if i % 2 == 0:
        result.append(i ** 2)
    else:
        result.append(i)

print(f'变换后，s = {result}')
