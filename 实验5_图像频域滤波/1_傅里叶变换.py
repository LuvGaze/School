import numpy as np
from matplotlib import pyplot as plt
from skimage import data

"""
中文显示工具函数
"""


def set_ch():
    from pylab import mpl
    mpl.rcParams['font.sans-serif'] = ['FangSong']
    mpl.rcParams['axes.unicode_minus'] = False


set_ch()

img = data.camera()  # 加载相机图像数据
f = np.fft.fft2(img)  # 快速傅里叶变换算法得到频率分布
fshift = np.fft.fftshift(f)  # 默认结果中心点位置是在左上角，转移到中间位置
fimg = np.log(np.abs(fshift))  # fft 结果是复数，求绝对值结果才是振幅

# 展示结果
plt.subplot(121), plt.imshow(img, 'gray'), plt.title('原始图像')
plt.subplot(122), plt.imshow(fimg, 'gray'), plt.title('傅里叶频谱')
plt.show()
