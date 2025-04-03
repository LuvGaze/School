from matplotlib import pyplot as plt
from skimage import filters
from skimage import io

#   from skimage import data


# img为原始图像
#   img = data.camera()
img = io.imread('Picture.jpg', as_gray=True)

# sobel算子
img_sobel_h = filters.sobel_h(img)
img_sobel_v = filters.sobel_v(img)
img_sobel = filters.sobel(img)

# 显示图像
plt.rcParams['font.size'] = 20
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
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

#   plt.savefig('sobels.tif')

plt.show()
