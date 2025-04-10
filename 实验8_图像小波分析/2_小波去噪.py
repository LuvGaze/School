#   新版本的 scikit-image 中，multichannel 已被弃用
#   替换为 channel_axis 参数
#   将 multichannel = True 替换为 channel_axis=-1


import matplotlib.pyplot as plt
from skimage import data, img_as_float
from skimage.restoration import (denoise_wavelet, estimate_sigma)
from skimage.util import random_noise


def set_ch():
    from pylab import mpl
    mpl.rcParams['font.sans-serif'] = ['FangSong']
    mpl.rcParams['axes.unicode_minus'] = False


set_ch()

# 加载原始图像并转换为浮点格式
original = img_as_float(data.coffee())
plt.subplot(221)
plt.axis('off')
plt.title('原始图像')
plt.imshow(original)

# 添加噪声
sigma = 0.2
noisy = random_noise(original, var=sigma ** 2)

plt.subplot(222)
plt.axis('off')
plt.title('加噪图像 noisy')
plt.imshow(noisy)

# 使用小波去噪（Haar 小波）
im_haar = denoise_wavelet(
    noisy,
    wavelet='db2',
    channel_axis=-1,  # 替换 multichannel=True
    convert2ycbcr=True
)
plt.subplot(223)
plt.axis('off')
plt.title('使用 haar 小波进行去噪')
plt.imshow(im_haar)

# 估计不同颜色通道的噪声平均标准差
sigma_est = estimate_sigma(noisy, channel_axis=-1, average_sigmas=True)
im_haar_sigma = denoise_wavelet(
    noisy,
    wavelet='db2',
    channel_axis=-1,  # 替换 multichannel=True
    convert2ycbcr=True,
    sigma=sigma_est
)
plt.subplot(224)
plt.axis('off')
plt.title('使用 haar with sigma 小波进行去噪')
plt.imshow(im_haar_sigma)

plt.show()
