import random


def get_random_list():
    random_list = []
    while True:
        num = random.randint(0, 10)
        if num not in random_list:
            random_list.append(num)
            if len(random_list) >= 5:
                return random_list


def print_list(list_):
    print('{', end='')
    for j in range(4):
        print(list_[j], end=', ')
    print(list_[4], end='} ')
    print(len(list_), max(list_), min(list_), sep=' ')


def print_(list_a, list_b):
    list_s = list_a
    for i in list_b:
        if i not in list_s:
            list_s.append(i)
    print('{', end='')
    for j in range(len(list_s) - 1):
        print(list_s[j], end=', ')
    l = len(list_s) - 1
    print(f'{list_s[l]}', end='}')


def and_(list_a, list_b):
    list_s = list("")
    for i in range(5):
        if list_a[i] in list_b:
            list_s.append(list_a[i])
    print('{', end='')
    for j in range(len(list_s) - 1):
        print(f'{list_s[j]}', end=',')
    print(list_s[len(list_s) - 1], end='}')


def or_(list_a, list_b):
    list_s = list("")
    for i in range(5):
        if list_a[i] not in list_b:
            list_s.append(list_a[i])
    print('{', end='')
    for j in range(len(list_s) - 1):
        print(f'{list_s[j]}', end=',')
    print(list_s[len(list_s) - 1], end='}')


list_A = get_random_list()
print_list(list_A)
list_B = get_random_list()
print_list(list_B)
print_(list_A, list_B)
and_(list_A, list_B)
or_(list_A, list_B)
