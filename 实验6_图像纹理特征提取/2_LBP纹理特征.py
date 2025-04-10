import skimage.feature
import skimage.segmentation
import matplotlib.pyplot as plt
from skimage.data import coffee

# 加载咖啡图像
img = coffee()

# 对每个颜色通道应用局部二值模式（LBP）
for colour_channel in (0, 1, 2):
    img[:, :, colour_channel] = skimage.feature.local_binary_pattern(
        img[:, :, colour_channel], 8, 1.0, method='var')

# 显示处理后的图像
plt.imshow(img)
plt.show()