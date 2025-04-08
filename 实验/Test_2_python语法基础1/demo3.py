import math

r = eval(input("输入球的半径："))
area = math.pi * r * r * 4
volume = math.pi * r * r * r * 4 / 3
print(str.format("球的表面积为：{0:2.2f}，体积为：{1:2.2f}", area, volume))
