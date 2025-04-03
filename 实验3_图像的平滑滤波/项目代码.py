import math
import numpy as np
from matplotlib import pyplot as plt
from scipy import signal, ndimage
from skimage import data, util


# 定义二维灰度图像的空间滤波函数
def corre12d(img, window):
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


# 原始图像
img = data.camera()

# 盒状滤波
window_box_3x3 = np.ones((3, 3)) / (3 ** 2)
window_box_5x5 = np.ones((5, 5)) / (5 ** 2)
window_box_9x9 = np.ones((9, 9)) / (9 ** 2)

new_img_box_3x3 = corre12d(img, window_box_3x3)
new_img_box_5x5 = corre12d(img, window_box_5x5)
new_img_box_9x9 = corre12d(img, window_box_9x9)

# 显示盒状滤波结果
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

plt.figure(figsize=(10, 8))
plt.subplot(2, 2, 1)
plt.axis('off')
plt.imshow(img, cmap='gray')
plt.title('(a)原图像')

plt.subplot(2, 2, 2)
plt.axis('off')
plt.imshow(new_img_box_3x3, cmap='gray')
plt.title('(b)3x3盒状滤波')

plt.subplot(2, 2, 3)
plt.axis('off')
plt.imshow(new_img_box_5x5, cmap='gray')
plt.title('(c)5x5盒状滤波')

plt.subplot(2, 2, 4)
plt.axis('off')
plt.imshow(new_img_box_9x9, cmap='gray')
plt.title('(d)9x9盒状滤波')

plt.tight_layout()
plt.show()  # 第一个图像窗口：盒状滤波


# 高斯平滑滤波
window_gauss_3x3 = gauss_window(1, 1.0)
window_gauss_5x5 = gauss_window(2, 1.0)
window_gauss_7x7 = gauss_window(3, 1.0)

new_img_gauss_3x3 = corre12d(img, window_gauss_3x3)
new_img_gauss_5x5 = corre12d(img, window_gauss_5x5)
new_img_gauss_7x7 = corre12d(img, window_gauss_7x7)

# 显示高斯平滑滤波结果
plt.figure(figsize=(10, 8))
plt.subplot(2, 2, 1)
plt.axis('off')
plt.imshow(img, cmap='gray')
plt.title('(a)原图像')

plt.subplot(2, 2, 2)
plt.axis('off')
plt.imshow(new_img_gauss_3x3, cmap='gray')
plt.title('(b)3x3高斯平滑')

plt.subplot(2, 2, 3)
plt.axis('off')
plt.imshow(new_img_gauss_5x5, cmap='gray')
plt.title('(c)5x5高斯平滑')

plt.subplot(2, 2, 4)
plt.axis('off')
plt.imshow(new_img_gauss_7x7, cmap='gray')
plt.title('(d)7x7高斯平滑')

plt.tight_layout()
plt.show()  # 第二个图像窗口：高斯平滑滤波


# 中值滤波
img_astronaut = data.astronaut()[:, :, 0]
noise_img = util.random_noise(img_astronaut, mode='s&p', amount=0.1)
new_img_median = ndimage.median_filter(noise_img, (3, 3))

# 显示中值滤波结果
plt.figure(figsize=(10, 4))
plt.subplot(1, 3, 1)
plt.axis('off')
plt.imshow(img_astronaut, cmap='gray')
plt.title('(a)原图像')

plt.subplot(1, 3, 2)
plt.axis('off')
plt.imshow(noise_img, cmap='gray')
plt.title('(b)加噪图像')

plt.subplot(1, 3, 3)
plt.axis('off')
plt.imshow(new_img_median, cmap='gray')
plt.title('(c)中值滤波')

plt.tight_layout()
plt.show()  # 第三个图像窗口：中值滤波