import math


def mymath(r):
    print(f'圆的周长 = {2 * r * math.pi:.2f}\n'
          f'圆的面积 = {r ** 2 * math.pi:.2f}\n'
          f'球的表面积 = {4 * r * r * math.pi:.2f}\n'
          f'球的体积 = {4 * r * r * r * math.pi / 3 :.2f}\n')


R = int(input("请输入半径："))
mymath(R)
