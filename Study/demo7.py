ls = [1, 2, 4, 3, 4, 6, 5, 6, 7, 8, 9]
for i in ls:
    print(i, ls, end='')
    if i % 2 == 0:
        ls.remove(i)
        print('\n', ls)
