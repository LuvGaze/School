list = [1, 1, 2, 3, 4, 5, 6, 6]

print(f'原列表为：list = {list}')

new_list = []

for i in list:
    if i not in new_list:
        new_list.append(i)

print(f'新列表为：list = {new_list}')
