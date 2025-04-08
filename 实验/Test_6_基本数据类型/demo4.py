import random


# 方法1
def n1():
    global a, b, c
    if a > b:
        a, b = b, a
    if a > c:
        a, c = c, a
    if b > c:
        b, c = c, b
    print(f'(方法一)升序值： a={a}, b={b}, c={c}')


# 方法2
def n2():
    global a, b, c
    q = max(a, b, c)
    w = min(a, b, c)
    e = a + b + c - q - w
    print(f'(方法二)升序值： a={w}, b={e}, c={q}')


a = random.randint(0, 100)
b = random.randint(0, 100)
c = random.randint(0, 100)44
print(f'原始值： a={a}, b={b}, c={c}')
n1()
n2()
