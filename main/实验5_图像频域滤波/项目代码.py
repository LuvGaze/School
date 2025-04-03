# 导入相关库
import numpy as np
from matplotlib import pyplot as plt
from skimage import data, color

"""
中文显示工具函数
"""


def set_ch():
    from pylab import mpl
    mpl.rcParams['font.sans-serif'] = ['FangSong']
    mpl.rcParams['axes.unicode_minus'] = False


set_ch()

# 第一部分：傅里叶变换展示
img1 = data.camera()  # 加载相机图像数据
f1 = np.fft.fft2(img1)  # 快速傅里叶变换算法得到频率分布
fshift1 = np.fft.fftshift(f1)  # 默认结果中心点位置是在左上角，转移到中间位置
fimg1 = np.log(np.abs(fshift1))  # fft 结果是复数，求绝对值结果才是振幅

# 展示结果
plt.figure(figsize=(8, 4))
plt.subplot(121), plt.imshow(img1, 'gray'), plt.title('原始图像')
plt.subplot(122), plt.imshow(fimg1, 'gray'), plt.title('傅里叶频谱')
plt.tight_layout()
plt.show()  # 第一个窗口

# 第二部分：理想低通滤波器
D = 10
new_img2 = data.coffee()
new_img2 = color.rgb2gray(new_img2)

f2 = np.fft.fft2(new_img2)
fshift2 = np.fft.fftshift(f2)

rows, cols = new_img2.shape
crow, ccol = int(rows / 2), int(cols / 2)  # 计算频谱中心
mask = np.zeros((rows, cols), np.uint8)  # 生成rows行cols的矩阵，数据格式为uint8
for i in range(rows):
    for j in range(cols):
        if np.sqrt(i ** 2 + j ** 2) <= D:
            mask[crow - D:crow + D, ccol - D:ccol + D] = 1

fshift2 = fshift2 * mask

# 傅里叶逆变换
f_ishift2 = np.fft.ifftshift(fshift2)
img_back2 = np.fft.ifft2(f_ishift2)
img_back2 = np.abs(img_back2)
img_back2 = (img_back2 - np.amin(img_back2)) / (np.amax(img_back2) - np.amin(img_back2))

plt.figure(figsize=(8, 4))
plt.subplot(121), plt.imshow(new_img2, cmap='gray'), plt.title('原始图像')
plt.subplot(122), plt.imshow(img_back2, cmap='gray'), plt.title('理想低通滤波后图像')
plt.tight_layout()
plt.show()  # 第二个窗口

# 第三部分：巴特沃斯低通滤波器
img3 = data.coffee()
img3 = color.rgb2gray(img3)

f3 = np.fft.fft2(img3)
fshift3 = np.fft.fftshift(f3)

# 巴特沃斯低通滤波器函数
def butterworthPassFilter(image, d, n):
    f = np.fft.fft2(image)
    fshift = np.fft.fftshift(f)

    def make_transform_matrix(d):
        transform_matrix = np.zeros(image.shape)
        center_point = tuple(map(lambda x: (x - 1) / 2, image.shape))
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

# 应用巴特沃斯低通滤波器
butter_100_1 = butterworthPassFilter(img3, 100, 1)
butter_30_1 = butterworthPassFilter(img3, 30, 1)
butter_30_5 = butterworthPassFilter(img3, 30, 5)

plt.figure(figsize=(12, 8))
plt.subplot(221), plt.axis("off"), plt.title('原始图像')
plt.imshow(img3, cmap='gray')

plt.subplot(222), plt.axis("off"), plt.title('巴特沃斯 截止频率100 阶数1')
plt.imshow(butter_100_1, cmap='gray')

plt.subplot(223), plt.axis("off"), plt.title('巴特沃斯 截止频率30 阶数1')
plt.imshow(butter_30_1, cmap='gray')

plt.subplot(224), plt.axis("off"), plt.title('巴特沃斯 截止频率30 阶数5')
plt.imshow(butter_30_5, cmap='gray')

plt.tight_layout()
plt.show()  # 第三个窗口