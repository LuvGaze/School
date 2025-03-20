import matplotlib.pyplot as plt
import numpy as np
from skimage import io, transform

# 设置字体为SimHei以支持中文显示
plt.rcParams['font.sans-serif'] = ['SimHei']  # 使用黑体作为默认字体
plt.rcParams['axes.unicode_minus'] = False  # 解决负号 '-' 显示为方块的问题


def load_image(path, as_gray=False):
    """
    加载图像文件。

    参数:
        path (str): 图像文件的路径。
        as_gray (bool): 如果为True，则将图像转换为灰度图。

    返回:
        numpy.ndarray: 图像数据数组。
    """
    return io.imread(path, as_gray=as_gray)


def get_image_info(image):
    """
    打印图像的基本信息，包括大小、形状和数据类型。

    参数:
        image (numpy.ndarray): 图像数据数组。
    """
    print(f"图像大小: {image.size}")  # 打印图像的总像素数
    print(f"图像形状: {image.shape}")  # 打印图像的高度、宽度（以及通道数）
    print(f"图像数据类型: {image.dtype}")  # 打印图像的数据类型


def mean_downsample(img, block_size=(8, 8)):
    """
    对图像进行下采样，通过计算每个块的平均值来缩小图像尺寸。

    参数:
        img (numpy.ndarray): 输入图像。
        block_size (tuple): 每个块的尺寸，默认是(8, 8)。

    返回:
        numpy.ndarray: 下采样后的图像。
    """
    new_height = img.shape[0] // block_size[0]  # 计算新高度
    new_width = img.shape[1] // block_size[1]  # 计算新宽度
    result = np.zeros((new_height, new_width))  # 创建一个空的结果数组
    for i in range(0, img.shape[0], block_size[0]):
        for j in range(0, img.shape[1], block_size[1]):
            result[i // block_size[0], j // block_size[1]] = np.mean(
                img[i:i + block_size[0], j:j + block_size[1]])  # 计算每个块的平均值并赋值给结果数组
    return result.astype(np.uint8)  # 转换为无符号8位整型


def quantize_to_two_levels(image):
    """
    将图像量化为两个灰度级别：0和255。

    参数:
        image (numpy.ndarray): 输入图像。

    返回:
        numpy.ndarray: 量化的图像。
    """
    return ((image > 128) * 255).astype(np.uint8)  # 如果像素值大于128，则设为255；否则设为0


def image_operations(img1, img2):
    """
    对两幅图像进行加法和减法运算。

    参数:
        img1 (numpy.ndarray): 第一幅图像。
        img2 (numpy.ndarray): 第二幅图像。

    返回:
        tuple: 包含加法和减法结果的元组。
    """
    if img1.shape != img2.shape:
        img2 = transform.resize(img2, (img1.shape[0], img1.shape[1]), anti_aliasing=True)  # 调整img2大小与img1相同
    add_image = np.clip(img1 + img2, 0, 255).astype(np.uint8)  # 图像相加，并限制结果在0到255之间
    sub_image = np.clip(img1 - img2, 0, 255).astype(np.uint8)  # 图像相减，并限制结果在0到255之间
    return add_image, sub_image


def power_transform(image, power):
    """
    对图像进行幂次变换。

    参数:
        image (numpy.ndarray): 输入图像。
        power (float): 幂次。

    返回:
        numpy.ndarray: 变换后的图像。
    """
    transformed_image = np.power(image / 255.0, power) * 255  # 对图像进行幂次变换
    return np.clip(transformed_image, 0, 255).astype(np.uint8)  # 限制结果在0到255之间


if __name__ == "__main__":
    # 加载图像
    image = load_image(r'./Picture/P01.jpg', as_gray=True)
    another_image = load_image(r'./Picture/P02.jpg', as_gray=True)

    # 获取并打印图像信息
    get_image_info(image)

    # 求均值法进行图像模拟采样
    downsampled_image = mean_downsample(image)
    plt.figure()
    plt.imshow(downsampled_image, cmap='gray')  # 使用灰度色谱显示图像
    plt.title("使用求均值法进行图像模拟采样的结果")
    plt.show()

    # 将256级灰度图像量化到仅有2个灰度级
    quantized_image = quantize_to_two_levels(image)
    plt.figure()
    plt.imshow(quantized_image, cmap='gray')
    plt.title("将256级灰度图像量化到仅有2个灰度级的结果")
    plt.show()

    # 图像的加法及减法操作
    add_image, sub_image = image_operations(image, another_image)
    fig, axs = plt.subplots(1, 2, figsize=(14, 7))  # 创建一个包含两个子图的图形窗口
    axs[0].imshow(add_image, cmap='gray')
    axs[0].set_title('图像加法的结果')
    axs[1].imshow(sub_image, cmap='gray')
    axs[1].set_title('图像减法的结果')
    plt.show()

    # 不同幂次的运算
    power_2_image = power_transform(image, 2)  # 幂次为2的变换
    power_half_image = power_transform(image, 0.5)  # 幂次为0.5的变换
    fig, axs = plt.subplots(1, 3, figsize=(15, 5))  # 创建一个包含三个子图的图形窗口
    axs[0].imshow(image, cmap='gray')
    axs[0].set_title('原始图像')
    axs[1].imshow(power_2_image, cmap='gray')
    axs[1].set_title('幂次为2的变换结果')
    axs[2].imshow(power_half_image, cmap='gray')
    axs[2].set_title('幂次为0.5的变换结果')
    plt.show()
