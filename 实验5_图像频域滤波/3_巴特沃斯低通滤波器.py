import matplotlib.pyplot as plt
import numpy as np
from skimage import data, color

img = data.coffee()
img = color.rgb2gray(img)  # 直接读为灰度图像
f = np.fft.fft2(img)
fshift = np.fft.fftshift(f)

"""
中文显示工具函数
"""


def set_ch():
    from pylab import mpl
    mpl.rcParams['font.sans-serif'] = ['FangSong']
    mpl.rcParams['axes.unicode_minus'] = False


set_ch()

# 取绝对值：将复数变化成实数
# 取对数的目的为了将数据变化到0-255
s1 = np.log(np.abs(fshift))

"""
巴特沃斯低通滤波器
"""


def butterworthPassFilter(image, d, n):
    f = np.fft.fft2(image)
    fshift = np.fft.fftshift(f)

    def make_transform_matrix(d):
        transform_matrix = np.zeros(image.shape)
        center_point = tuple(map(lambda x: (x - 1) / 2, s1.shape))
        for i in range(transform_matrix.shape[0]):
            for j in range(transform_matrix.shape[1]):
                def cal_distance(pa, pb):
                    from math import sqrt
                    dis = sqrt((pa[0] - pb[0]) ** 2 + (pa[1] - pb[1]) ** 2)
                    return dis

                dis = cal_distance(center_point, (i, j))
                transform_matrix[i, j] = 1 / (1 + (dis / d) ** (2 * n))

        return transform_matrix

    d_matrix = make_transform_matrix(d)
    new_img = np.abs(np.fft.ifft2(np.fft.ifftshift(fshift * d_matrix)))
    return new_img


plt.subplot(221)
plt.axis("off")
plt.title('Original')
plt.imshow(img, cmap='gray')

plt.subplot(222)
plt.axis('off')
plt.title('巴特沃斯 截止频率100 阶数1')
butter_100_1 = butterworthPassFilter(img, 100, 1)
plt.imshow(butter_100_1, cmap='gray')

plt.subplot(223)
plt.axis('off')
plt.title('巴特沃斯 截止频率30 阶数1')
butter_30_1 = butterworthPassFilter(img, 30, 1)
plt.imshow(butter_30_1, cmap='gray')

plt.subplot(224)
plt.axis('off')
plt.title('巴特沃斯 截止频率30 阶数5')
butter_30_5 = butterworthPassFilter(img, 30, 5)
plt.imshow(butter_30_5, cmap='gray')

plt.show()
