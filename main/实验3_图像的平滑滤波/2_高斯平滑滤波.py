import math

import numpy as np
from matplotlib import pyplot as plt
from scipy import signal
from skimage import data


# 定义二维灰度图像的空间滤波函数
def corre12d(img, window):
    # 使用滤波器实现图像的空间相关
    # mode = 'same' 表示输出尺寸等于输入尺寸
    # boundary = 'fill' 表示滤波前，用常量值填充原图像的边缘，默认常量值为0
    s = signal.correlate2d(img, window, mode='same', boundary='fill')
    return s.astype(np.uint8)


# 定义二维高斯函数
def gauss(i, j, sigma):
    return 1 / (2 * math.pi * sigma ** 2) * math.exp(-(i ** 2 + j ** 2) / (2 * sigma ** 2))


# 定义radius*radius的高斯平滑模板
def gauss_window(radius, sigma):
    window = np.zeros((radius * 2 + 1, radius * 2 + 1))
    for i in range(-radius, radius + 1):
        for j in range(-radius, radius + 1):
            window[i + radius][j + radius] = gauss(i, j, sigma)
    return window / np.sum(window)


# img为原始图像
img = data.camera()

# 3*3高斯平滑滤波模板
window1 = gauss_window(3, 1.0)

# 5*5高斯平滑滤波模板
window2 = gauss_window(5, 1.0)

# 7*7高斯平滑滤波模板
window3 = gauss_window(9, 1.0)

# 生成滤波结果
new_img1 = corre12d(img, window1)
new_img2 = corre12d(img, window2)
new_img3 = corre12d(img, window3)

# 显示图像
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
plt.subplot(2, 2, 1)
plt.axis('off')
plt.imshow(img, cmap='gray')
plt.title('(a)原图像')

plt.subplot(2, 2, 2)
plt.axis('off')
plt.imshow(new_img1, cmap='gray')
plt.title('(b)3*3高斯平滑滤波结果')

plt.subplot(2, 2, 3)
plt.axis('off')
plt.imshow(new_img2, cmap='gray')
plt.title('(c)5*5高斯平滑滤波结果')

plt.subplot(2, 2, 4)
plt.axis('off')
plt.imshow(new_img3, cmap='gray')
plt.title('(d)9*9高斯平滑滤波结果')

#   plt.savefig('高斯平滑滤波结果.tif')


plt.show()
