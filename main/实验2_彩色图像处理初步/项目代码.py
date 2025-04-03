import math
import numpy as np
from matplotlib import pyplot as plt
from skimage import data, color

# 设置matplotlib支持中文显示
plt.rcParams['font.sans-serif'] = ['SimHei']  # 使用黑体字体
plt.rcParams['axes.unicode_minus'] = False  # 解决负号显示问题
plt.rcParams.update({'font.size': 20})  # 全局设置字体大小为12

# 加载图像
img = data.coffee()

# 第一部分：灰度转换与强度分层
grayimg = color.rgb2gray(img)  # 将彩色图像转化为灰度图像
rows, cols = grayimg.shape
labels = np.zeros([rows, cols])
for i in range(rows):
    for j in range(cols):
        if grayimg[i, j] < 0.4:
            labels[i, j] = 1
        elif grayimg[i, j] < 0.8:
            labels[i, j] = 2
        else:
            labels[i, j] = 3
psdimg = color.label2rgb(labels)  # 不同的label采用不同的颜色

# 第二部分：伪彩色变换
L = 255


def GetR(gray):
    gray = float(gray)  # 确保输入是浮点数
    if gray < L / 2:
        return 0
    elif gray > L / 4 * 3:
        return L
    else:
        value = 4 * gray - 2 * L  # 中间计算使用浮点数
        return int(np.clip(value, 0, 255))  # 最终结果限制在 [0, 255]


def GetG(gray):
    gray = float(gray)  # 确保输入是浮点数
    if gray < L / 4:
        value = 4 * gray  # 中间计算使用浮点数
        return int(np.clip(value, 0, 255))
    elif gray > L / 4 * 3:
        value = 4 * L - 4 * gray  # 中间计算使用浮点数
        return int(np.clip(value, 0, 255))
    else:
        return L


def GetB(gray):
    gray = float(gray)  # 确保输入是浮点数
    if gray < L / 4:
        return L
    elif gray > L / 2:
        return 0
    else:
        value = 2 * L - 4 * gray  # 中间计算使用浮点数
        return int(np.clip(value, 0, 255))


grayimg_255 = (color.rgb2gray(img) * 255).astype(np.uint8)  # 将彩色图像转化为灰度图像并缩放到0-255范围
colorimg = np.zeros((img.shape[0], img.shape[1], 3), dtype='uint8')
for ii in range(img.shape[0]):
    for jj in range(img.shape[1]):
        r, g, b = GetR(grayimg_255[ii, jj]), GetG(grayimg_255[ii, jj]), GetB(grayimg_255[ii, jj])
        colorimg[ii, jj, :] = [r, g, b]

# 第三部分：RGB转HSI及分割
def rgb2hsi(r, g, b):
    r = r / 255
    g = g / 255
    b = b / 255

    num = 0.5 * ((r - g) + (r - b))
    den = ((r - g) * (r - g) + (r - b) * (g - b)) ** 0.5
    if b <= g:
        h = math.acos(num / den) if den != 0 else 0
    else:
        h = (2 * math.pi) - math.acos(num / den) if den != 0 else 0
    s = 1 - (3 * min(r, g, b) / (r + g + b)) if (r + g + b) != 0 else 0
    i = (r + g + b) / 3
    return h, s, i


hsi_image = np.zeros((img.shape[0], img.shape[1], 3))
for ii in range(img.shape[0]):
    for jj in range(img.shape[1]):
        r, g, b = img[ii, jj, :]
        hsi_image[ii, jj, :] = [*rgb2hsi(r, g, b)]

H = hsi_image[:, :, 0]
S = hsi_image[:, :, 1]
I = hsi_image[:, :, 2]

# 生成二值饱和度模板
S_template = np.where(S > 0.3 * S.max(), 1, 0)

# 色调图像与二值饱和度模板相乘可得到分割结果F
F = H * S_template

# 创建第一个Plot，包括灰度图像和强度分层图像
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.axis('off')
plt.imshow(grayimg, cmap='gray')
plt.title('(a) 灰度图像')

plt.subplot(1, 2, 2)
plt.axis('off')
plt.imshow(psdimg)
plt.title('(b) 强度分层图像')

plt.show()

# 创建第二个Plot，包括灰度图像和伪彩色图像
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.axis('off')
plt.imshow(grayimg, cmap='gray')
plt.title('(a) 灰度图像')

plt.subplot(1, 2, 2)
plt.axis('off')
plt.imshow(colorimg)
plt.title('(b) 伪彩色图像')

plt.show()

# 创建第三个Plot，包括原始RGB图像、H分量、S分量、I分量、二值饱和度模板和分割结果
plt.figure(figsize=(15, 10))
plt.subplot(2, 3, 1)
plt.axis('off')
plt.imshow(img)
plt.title('(a) 原始RGB图像')

plt.subplot(2, 3, 2)
plt.axis('off')
plt.imshow(H, cmap='gray')
plt.title('(b) H分量')

plt.subplot(2, 3, 3)
plt.axis('off')
plt.imshow(S, cmap='gray')
plt.title('(c) S分量')

plt.subplot(2, 3, 4)
plt.axis('off')
plt.imshow(I, cmap='gray')
plt.title('(d) I分量')

plt.subplot(2, 3, 5)
plt.axis('off')
plt.imshow(S_template, cmap='gray')
plt.title('(e) 二值饱和度模板')

plt.subplot(2, 3, 6)
plt.axis('off')
plt.imshow(F, cmap='gray')
plt.title('(f) 分割结果')

plt.show()