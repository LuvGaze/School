import itertools

for _ in itertools.count():  # itertools.count() 创建一个无限迭代器
    n = int(input("请输入一个非负整数: "))
    if n >= 0:
        break
result = 1
for i in range(1, n + 1):
    result *= i
print(f"  for 循环：{n}! = {result}")

result = 1
for i in range(1, n + 1):
    result *= i
print(f"while 循环：{n}! = {result}")
