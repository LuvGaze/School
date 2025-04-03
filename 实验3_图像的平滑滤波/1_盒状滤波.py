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


# img为原始图像
img = data.camera()

# 3*3盒状滤波模板
window1 = np.ones((3, 3)) / (3 ** 2)

# 5*5盒状滤波模板
window2 = np.ones((5, 5)) / (5 ** 2)

# 9*9盒状滤波模板
window3 = np.ones((9, 9)) / (9 ** 2)

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
plt.title('(b)3*3盒状滤波结果')

plt.subplot(2, 2, 3)
plt.axis('off')
plt.imshow(new_img2, cmap='gray')
plt.title('(c)5*5盒状滤波结果')

plt.subplot(2, 2, 4)
plt.axis('off')
plt.imshow(new_img3, cmap='gray')
plt.title('(d)9*9盒状滤波结果')

#   plt.savefig('盒状滤波结果.tif')

plt.show()
