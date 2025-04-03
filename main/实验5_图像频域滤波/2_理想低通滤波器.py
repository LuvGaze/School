# 导入相关库
import matplotlib.pyplot as plt
import numpy as np
from skimage import data, color

"""
中文显示工具函数
"""


def set_ch():
    from pylab import mpl
    mpl.rcParams['font.sans-serif'] = ['FangSong']
    mpl.rcParams['axes.unicode_minus'] = False


set_ch()

D = 10
# 读入图片
new_img = data.coffee()
new_img = color.rgb2gray(new_img)

# numpy中的傅里叶变换
f1 = np.fft.fft2(new_img)
f1_shift = np.fft.fftshift(f1)
# np.fft.fftshift()函数来实现平移，让直流分量在输出图像的重心

# 实现理想低通滤波器
rows, cols = new_img.shape
crow, ccol = int(rows / 2), int(cols / 2)  # 计算频谱中心
mask = np.zeros((rows, cols), np.uint8)  # 生成rows行cols的矩阵，数据格式为uint8
for i in range(rows):
    for j in range(cols):
        if np.sqrt(i ** 2 + j ** 2) <= D:
            mask[crow - D:crow + D, ccol - D:ccol + D] = 1

f1_shift = f1_shift * mask

# 傅里叶逆变换
f_ishift = np.fft.ifftshift(f1_shift)
img_back = np.fft.ifft2(f_ishift)
img_back = np.abs(img_back)
img_back = (img_back - np.amin(img_back)) / (np.amax(img_back) - np.amin(img_back))

# plt.figure(figsize=(15,8))
plt.figure()

plt.subplot(121), plt.imshow(new_img, cmap='gray'), plt.title('原始图像')
plt.subplot(122), plt.imshow(img_back, cmap='gray'), plt.title('滤波后图像')
plt.show()
