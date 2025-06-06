import numpy as np
from skimage import io, img_as_float

img = img_as_float(io.imread('习题_3和4.jpg', as_gray=True))
c = 255 / np.log(1 + np.max(img))
log_img = (c * np.log(1 + img)).astype(np.uint8)

io.imsave('输出图像/习题4_对数变换.jpg', log_img)