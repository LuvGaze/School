from PIL import Image

# 打开原始灰度图像并转换为灰度图像
img = Image.open('习题_3和4.jpg').convert('L')
# 应用反色运算
inverted_img = img.point(lambda px: 255 - px)
# 保存结果图像
inverted_img.save('输出图像/习题3_反色运算.jpg')