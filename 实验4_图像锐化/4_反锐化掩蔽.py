import numpy as np
from matplotlib import pyplot as plt
from scipy import signal
from skimage import io


#   from skimage import data


# 定义二维灰度图像的空间滤波函数
def corre12d(img, window):
    s = signal.correlate2d(img, window, mode='same', boundary='fill')
    return s


# img为原始图像
#   img = data.camera()
img = io.imread('Picture.jpg', as_gray=True)

# 3*3盒状滤波模板
window = np.ones((3, 3)) / (5 ** 2)
img_blur = corre12d(img, window)

img_edge = img - img_blur
img_enhance = img + img_edge

# 显示图像
plt.rcParams['font.size'] = 20
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
plt.subplot(2, 2, 1)
plt.imshow(img, cmap='gray')
plt.axis('off')
plt.title('原图像')

plt.subplot(2, 2, 2)
plt.imshow(img_blur, cmap='gray')
plt.axis('off')
plt.title('模糊图像')

plt.subplot(2, 2, 3)
plt.imshow(img_edge, cmap='gray')
plt.axis('off')
plt.title('差值图像')

plt.subplot(2, 2, 4)
plt.imshow(img_enhance, cmap='gray')
plt.axis('off')
plt.title('锐化增强')

#   plt.savefig('反锐化掩蔽.tif')

plt.show()
