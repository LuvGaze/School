from matplotlib.font_manager import FontProperties
from skimage import data, io, exposure

font_set = FontProperties('SimSun', size=12)
from matplotlib import pyplot as plt
import numpy as np  # 导入所需类包

# 均值法对图像采样
image = data.coffee()  # 载入测试图像
print(image.shape)  # 显示图像原始大小
print(type(image))  # 显示图像类型
ratio = 20  # 设置采样比率
image1 = np.zeros((int(image.shape[0] / ratio),
                   int(image.shape[1] / ratio), image.shape[2]), dtype='int32')  # 设置采样后图像大小
for i in range(image1.shape[0]):
    for j in range(image1.shape[1]):
        for k in range(image1.shape[2]):  # 对图像进行遍历
            delta = image[i * ratio:(i + 1) * ratio, j * ratio:(j + 1) * ratio, k]  # 获取需要采样图像块
            image1[i, j, k] = np.mean(delta)  # 计算均值，并存入结果图像
plt.imshow(image1)  # 打印采样后图像图像
plt.show()

# 2级灰度级量化
image = data.coffee()  # 载入测试图像
ratio = 128
for i in range(image.shape[0]):
    for j in range(image.shape[1]):
        for k in range(image.shape[2]):
            image[i][j][k] = int(image[i][j][k] / ratio) * ratio
# 对图像每个像素进行量化
plt.imshow(image)  # 打印采样后图像图像
plt.show()
# 设置量化比率


# 算数运算
moon = data.moon()
camera = data.camera()
image_minus = moon - camera
image_plus = moon + camera
plt.set_cmap(cmap='gray')
plt.subplot(2, 2, 1)
plt.title('月亮图像', fontproperties=font_set)
plt.imshow(moon)
plt.subplot(2, 2, 2)
plt.title('摄影师图像', fontproperties=font_set)
plt.imshow(camera)
plt.subplot(2, 2, 3)
plt.title('月亮加摄影师图像', fontproperties=font_set)
plt.imshow(image_plus)
plt.subplot(2, 2, 4)
plt.title('月亮减摄影师图像', fontproperties=font_set)
plt.imshow(image_minus)
plt.show()

# 不同伽马值情况下的幂次变换
image = data.coffee()  # 读入图像
# 分别计算gamma=0.2,0.67,25时的图像
image_1 = exposure.adjust_gamma(image, 0.1)
image_2 = exposure.adjust_gamma(image, 0.67)
image_3 = exposure.adjust_gamma(image, 25)
# 分别展示原图及结果图像
plt.subplot(2, 2, 1)
plt.title('gamma=1')
io.imshow(image)
plt.subplot(2, 2, 2)
plt.title('gamma=0.2')
io.imshow(image_1)
plt.subplot(2, 2, 3)
plt.title('gamma=0.67')
io.imshow(image_2)
plt.subplot(2, 2, 4)
plt.title('gamma=25')
io.imshow(image_3)
plt.show()
