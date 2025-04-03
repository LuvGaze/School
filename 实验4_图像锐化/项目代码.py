import numpy as np
from matplotlib import pyplot as plt
from scipy import signal
from skimage import filters, io

# 定义二维灰度图像的空间滤波函数
def corre12d(img, window):
    s = signal.correlate2d(img, window, mode='same', boundary='fill')
    return s

# 读取图像
img = io.imread('Picture.jpg', as_gray=True)

# 设置matplotlib字体以支持中文显示
plt.rcParams['font.size'] = 20
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# ========================================
# 罗伯特交叉梯度算子
img_robert_pos = filters.roberts_pos_diag(img)
img_robert_neg = filters.roberts_neg_diag(img)
img_robert = filters.roberts(img)

# 显示罗伯特算子结果
plt.figure(figsize=(12, 8))
plt.suptitle("罗伯特算子", fontsize=24)
plt.subplot(2, 2, 1)
plt.imshow(img, cmap='gray')
plt.axis('off')
plt.title('原图像')

plt.subplot(2, 2, 2)
plt.imshow(img_robert_pos, cmap='gray')
plt.axis('off')
plt.title('robert_pos')

plt.subplot(2, 2, 3)
plt.imshow(img_robert_neg, cmap='gray')
plt.axis('off')
plt.title('robert_neg')

plt.subplot(2, 2, 4)
plt.imshow(img_robert, cmap='gray')
plt.axis('off')
plt.title('robert')

# ========================================
# Sobel算子
img_sobel_h = filters.sobel_h(img)
img_sobel_v = filters.sobel_v(img)
img_sobel = filters.sobel(img)

# 显示Sobel算子结果
plt.figure(figsize=(12, 8))
plt.suptitle("Sobel算子", fontsize=24)
plt.subplot(2, 2, 1)
plt.imshow(img, cmap='gray')
plt.axis('off')
plt.title('原图像')

plt.subplot(2, 2, 2)
plt.imshow(img_sobel_h, cmap='gray')
plt.axis('off')
plt.title('sobel_h')

plt.subplot(2, 2, 3)
plt.imshow(img_sobel_v, cmap='gray')
plt.axis('off')
plt.title('sobel_v')

plt.subplot(2, 2, 4)
plt.imshow(img_sobel, cmap='gray')
plt.axis('off')
plt.title('sobel')

# ========================================
# Laplace算子
img_laplace = filters.laplace(img, ksize=3, mask=None)
img_enhance = img + img_laplace

# 显示Laplace算子结果
plt.figure(figsize=(12, 8))
plt.suptitle("Laplace算子", fontsize=24)
plt.subplot(1, 3, 1)
plt.imshow(img, cmap='gray')
plt.axis('off')
plt.title('原图像')

plt.subplot(1, 3, 2)
plt.imshow(img_laplace, cmap='gray')
plt.axis('off')
plt.title('laplace')

plt.subplot(1, 3, 3)
plt.imshow(img_enhance, cmap='gray')
plt.axis('off')
plt.title('锐化增强')

# ========================================
# 反锐化掩蔽
window = np.ones((3, 3)) / (5 ** 2)
img_blur = corre12d(img, window)
img_edge = img - img_blur
img_enhance_box = img + img_edge

# 显示反锐化掩蔽结果
plt.figure(figsize=(12, 8))
plt.suptitle("反锐化掩蔽", fontsize=24)
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
plt.imshow(img_enhance_box, cmap='gray')
plt.axis('off')
plt.title('锐化增强')

# 显示所有图像
plt.show()