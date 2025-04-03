from matplotlib import pyplot as plt
from scipy import ndimage
from skimage import data, util

# img为原始图像
img = data.astronaut()[:, :, 0]

# 对图像加入椒盐噪声（移除 seed 参数）
noise_img = util.random_noise(img, mode='s&p', amount=0.1)  # 使用 amount 参数控制噪声强度

# 中值滤波
n = 3
new_img = ndimage.median_filter(noise_img, (n, n))

# 显示图像
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
plt.subplot(1, 3, 1)
plt.axis('off')
plt.imshow(img, cmap='gray')
plt.title('(a)原图像')

plt.subplot(1, 3, 2)
plt.axis('off')
plt.imshow(noise_img, cmap='gray')
plt.title('(b)加噪图像')

plt.subplot(1, 3, 3)
plt.axis('off')
plt.imshow(new_img, cmap='gray')
plt.title('(c)中值滤波')

#   #   plt.savefig('加降噪结果.tif')

plt.show()
