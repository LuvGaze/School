'''
    本题课本示例出错
'''

import math

a = float(input("请输入系数a: "))
b = float(input("请输入系数b: "))
c = float(input("请输入系数c: "))

if a == 0:
    if b == 0:
        print("此方程无解！")
    else:
        x = -c / b
        print(f"此方程的解为: {x}")
else:
    t = b ** 2 - 4 * a * c
    if t > 0:
        x1 = (-b + math.sqrt(t)) / (2 * a)
        x2 = (-b - math.sqrt(t)) / (2 * a)
        print(f"方程有两个不等实根: {x1} 和 {x2}")

    elif t == 0:
        x = -b / (2 * a)
        print(f"此方程有两个相等的实根: {x}")

    else:
        re = -b / (2 * a)
        im = math.sqrt(abs(t)) / (2 * a)
        if t == -4 * a * c:
            print(f"此方程有两个相等虚根: x1 = x2 = {re} + {im}i")
        else:
            print(f"此方程有两个不等虚根: {re} + {im}i 和 {re} - {im}i")
