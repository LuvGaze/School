from skimage import io, transform
import numpy as np
import matplotlib.pyplot as plt

# 你的代码逻辑...

# 读取图像
def load_image(path, as_gray=False):
    return io.imread(path, as_gray=as_gray)

# 获取图像信息
def get_image_info(image):
    print(f"Image size: {image.size}")
    print(f"Image shape: {image.shape}")
    print(f"Image dtype: {image.dtype}")

# 使用求均值法进行图像模拟采样
def mean_downsample(img, block_size=(8, 8)):
    new_height = img.shape[0] // block_size[0]
    new_width = img.shape[1] // block_size[1]
    result = np.zeros((new_height, new_width))
    for i in range(0, img.shape[0], block_size[0]):
        for j in range(0, img.shape[1], block_size[1]):
            result[i//block_size[0], j//block_size[1]] = np.mean(
                img[i:i+block_size[0], j:j+block_size[1]])
    return result

# 图像量化到2个灰度级
def quantize_to_two_levels(image):
    return ((image > 128) * 255).astype(np.uint8)

# 图像加法及减法操作
def image_operations(img1, img2):
    if img1.shape != img2.shape:
        img2 = transform.resize(img2, (img1.shape[0], img1.shape[1]), anti_aliasing=True)
    add_image = np.clip(img1 + img2, 0, 255)
    sub_image = np.clip(img1 - img2, 0, 255)
    return add_image, sub_image

# 幂次变换
def power_transform(image, power):
    return np.clip(np.power(image/255.0, power) * 255, 0, 255)

# 主程序
if __name__ == "__main__":
    # 加载图像
    image = load_image('D:\\Desktop\\Python\\数字图像处理\\pythonProject\\实验\\Picture\\01.jpg', as_gray=True)
    another_image = load_image('D:\\Desktop\\Python\\数字图像处理\\pythonProject\\实验\\Picture\\01.jpg', as_gray=True)

    # 获取并打印图像信息
    get_image_info(image)

    # 求均值法进行图像模拟采样
    downsampled_image = mean_downsample(image)
    plt.imshow(downsampled_image, cmap='gray')
    plt.title("Mean Downsampled Image")
    plt.show()

    # 将256级灰度图像量化到仅有2个灰度级
    quantized_image = quantize_to_two_levels(image)
    plt.imshow(quantized_image, cmap='gray')
    plt.title("Quantized to 2 Levels")
    plt.show()

    # 图像的加法及减法操作
    add_image, sub_image = image_operations(image, another_image)
    fig, axs = plt.subplots(1, 2, figsize=(14, 7))
    axs[0].imshow(add_image, cmap='gray')
    axs[0].set_title('Image Addition')
    axs[1].imshow(sub_image, cmap='gray')
    axs[1].set_title('Image Subtraction')
    plt.show()

    # 不同幂次的运算
    power_2_image = power_transform(image, 2)
    power_half_image = power_transform(image, 0.5)
    fig, axs = plt.subplots(1, 3, figsize=(15, 5))
    axs[0].imshow(image, cmap='gray')
    axs[0].set_title('Original Image')
    axs[1].imshow(power_2_image, cmap='gray')
    axs[1].set_title('Power 2 Transformation')
    axs[2].imshow(power_half_image, cmap='gray')
    axs[2].set_title('Power 0.5 Transformation')
    plt.show()