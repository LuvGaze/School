x = float(input("请输入操作数x："))
y = float(input("请输入操作数y："))
s = input("请输入操作符：")

if y != 0:
    if s == '+':
        print(f'{x} + {y} = {x + y}')
    elif s == '-':
        print(f'{x} - {y} = {x - y}')
    elif s == '*':
        print(f'{x} * {y} = {x * y}')
    elif s == '/':
        print(f'{x} / {y} = {x / y}')
    elif s == '%':
        print(f'{x} % {y} = {x % y}')
else:
    print("分母=0，零除异常！")
