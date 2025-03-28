from matplotlib import pyplot as plt
from skimage import filters
from skimage import io

#   from skimage import data


# img为原始图像
#   img = data.camera()
img = io.imread('Picture.jpg', as_gray=True)

# Laplace算子
img_laplace = filters.laplace(img, ksize=50, mask=None)
img_enhance = img + img_laplace

# 显示图像
plt.rcParams['font.size'] = 20
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
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

#   plt.savefig('laplace.tif')

plt.show()
