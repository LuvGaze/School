# 非递归
def fact(x):
    s = 1
    for i in range(1, x + 1):
        s = s * i
    print(f'x ！= {s}')


# 递归
def fact_(x):
    if x == 0:
        return 1
    return x * fact_(x - 1)


n = int(input("请输入整数n(n>=0)："))
# 非递归
fact(n)

# 递归
print(f'x ！= {fact_(n)}')
