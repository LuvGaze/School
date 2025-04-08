import matplotlib.pyplot as plt
import numpy as np

# 随机生成满足mu为100,、sigma为20的正态分布的10万个智商数据
mu, sigma = 100, 20
x = mu + sigma * np.random.randn(100000)

# 绘制直方图
# 因matplotlib版本问题，下面两行代码只有一个能用
# plt.hist(x, 50, normed=1, facecolor='g', alpha=0.75)
plt.hist(x, 50, density=True, facecolor='g', alpha=0.75)

# 绘制坐标等信息
plt.xlabel('IQ')
plt.ylabel('Probability')
plt.title('Histogram of IQ')

# 设置坐标和网格
plt.axis([40, 180, 0, 0.03])
plt.grid(True)
plt.show()
