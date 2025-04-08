import math

a = eval(input())
b = eval(input())
c = eval(input())

if (a > 0 and b > 0 and c > 0) and (a + b > c and a + c > b and b + c > a):
    l = a + b + c
    h = l / 2
    s = math.sqrt(h*(h-a)*(h-b)*(h-c))
    print(f"周长是{l}")
    print(f"面积是{s}")
else:
    print("无法构成三角形！")
