% 清空工作区
clear; clc; close all;

% 读取图像（灰度图像）
I = imread('image.jpg'); % 替换为你的图像文件名
I = rgb2gray(I); % 如果图像是彩色的，转换为灰度图像

% 显示原始图像（时域）
figure;
subplot(1, 3, 1);
imshow(I, []);
title('原始图像（时域）', 'FontSize', 14);

% 对图像进行DCT变换
DCT_I = dct2(double(I)); % 将图像转换为双精度类型并进行DCT变换

% 显示DCT变换后的频域图像
subplot(1, 3, 2);
imshow(log(abs(DCT_I) + 1), []); % 使用log增强可视化效果
colormap jet; colorbar; % 设置颜色映射和色条
title('DCT变换后的频域图像', 'FontSize', 14);

% 对频域图像进行逆DCT变换，恢复到时域
IDCT_I = idct2(DCT_I); % 逆DCT变换
IDCT_I = uint8(IDCT_I); % 转换回uint8类型

% 显示逆DCT变换后的图像（时域）
subplot(1, 3, 3);
imshow(IDCT_I, []);
title('逆DCT变换后的图像（时域）', 'FontSize', 14);