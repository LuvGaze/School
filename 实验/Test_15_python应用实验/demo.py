import cv2


def pencil_sketch(image_path, output_path):
    # 读取图片
    img = cv2.imread(image_path)

    # 检查图片是否正确加载
    if img is None:
        print("图片无法加载，请检查路径是否正确！")
        return

    # 将图片转换为灰度图
    gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # 使用高斯模糊
    inverted_gray_img = 255 - gray_img
    blurred_img = cv2.GaussianBlur(inverted_gray_img, (21, 21), 0)

    # 将模糊后的图片再次取反
    inverted_blurred_img = 255 - blurred_img

    # 将原始灰度图与处理后的图片进行混合，得到素描效果
    pencil_sketch_img = cv2.divide(gray_img, inverted_blurred_img, scale=256.0)

    # 保存处理后的图片
    cv2.imwrite(output_path, pencil_sketch_img)
    print(f"手绘效果图片已保存至: {output_path}")


# 调用函数
pencil_sketch('010.jpg', 'output.jpg')
