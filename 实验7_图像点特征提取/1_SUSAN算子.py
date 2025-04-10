#   camera() 替换为 data.camera()

import numpy as np
from skimage import data  # 导入 skimage 的 data 模块
from matplotlib import pyplot as plt


def susan_mask():
    mask = np.ones((7, 7))
    mask[0, 0] = 0
    mask[0, 1] = 0
    mask[0, 5] = 0
    mask[0, 6] = 0
    mask[1, 0] = 0
    mask[1, 6] = 0
    mask[5, 0] = 0
    mask[5, 6] = 0
    mask[6, 0] = 0
    mask[6, 1] = 0
    mask[6, 5] = 0
    mask[6, 6] = 0
    return mask


def susan_corner_detection(img):
    img = img.astype(np.float64)
    g = 37 / 2
    circularMask = susan_mask()
    output = np.zeros(img.shape)

    for i in range(3, img.shape[0] - 3):
        for j in range(3, img.shape[1] - 3):
            ir = np.array(img[i - 3:i + 4, j - 3:j + 4])
            ir = ir[circularMask == 1]
            ir0 = img[i, j]
            a = np.sum(np.exp(-((ir - ir0) / 10) ** 6))
            if a <= g:
                a = g - a
            else:
                a = 0
            output[i, j] = a
    return output


# 加载测试图像
image = data.camera()  # 使用 skimage 提供的 camera 图像

# 执行 SUSAN 角点检测
out = susan_corner_detection(image)

# 显示结果
plt.imshow(out, cmap='gray')
plt.axis('off')  # 关闭坐标轴
plt.show()