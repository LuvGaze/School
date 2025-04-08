# 行数
n = 5

#定义杨辉三角数组
yh = []

for i in range(n):
    # 每一行的第一个元素是1
    row = [1] * (i + 1)

    # 计算中间的元素
    for j in range(1, i):
        row[j] = yh[i - 1][j - 1] + yh[i - 1][j]

    # 将这一行添加到三角形中
    yh.append(row)

# 计算最大行的宽度
max_width = len(' '.join(map(str, yh[-1])))

# 输出杨辉三角
for row in yh:
    row_str = ' '.join(map(str, row))
    print(row_str.center(max_width))
