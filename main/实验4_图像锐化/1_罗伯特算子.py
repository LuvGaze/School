from matplotlib import pyplot as plt
from skimage import filters
from skimage import io

#   from skimage import data


# img为原始图像
#   img = data.camera()
img = io.imread('Picture.jpg', as_gray=True)

# 罗伯特交叉梯度算子
img_robert_pos = filters.roberts_pos_diag(img)
img_robert_neg = filters.roberts_neg_diag(img)
img_robert = filters.roberts(img)

# 显示图像
plt.rcParams['font.size'] = 20
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
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

#   plt.savefig('roberts.tif')

plt.show()
