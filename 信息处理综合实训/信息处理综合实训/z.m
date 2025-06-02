N = 80; % 水印图像长度，表示水印图像的大小为80x80
K = 8; % 每个块的大小为8x8
alpha = 60; % 加权因子，用于调整水印的强度
Scale = 0.45; % 缩放因子，用于缩放攻击
noise_size = 0.1; % 噪声强度，用于噪声攻击
 
% 显示原图像
figure(1); 
subplot(2,2,1); % 创建2x2的子图，选择第一个位置
I = imread('image.jpg'); % 将原图像读入I中
imshow(I); % 显示图像                                                         
title('原始公开图像', 'FontSize', 50); % 设置标题
 
% 显示水印图像
subplot(2,2,2); % 选择第二个子图位置
J = imread('watermark.jpg'); % 将水印图像读入J中
J = logical(J); % 将水印图像转换为逻辑矩阵
imshow(J); % 显示水印图像
title('水印图像', 'FontSize', 50); % 设置标题
 
% 加密序列，用于水印嵌入
k1 = [-0.753745, 0.393264, 1.24142e-05, 0.765676, 1.49856, -0.123409, 0.461553, -1.76212]; % 加密序列1
k2 = [-1.5299, 0.117945, 1.46381, -0.892513, -0.919259, -1.28991, -1.03356, 1.03426]; % 加密序列2
 
% 水印嵌入算法
for p = 1:N % 从1到N循环，遍历水印图像的每一行
    for q = 1:N % 从1到N循环，遍历水印图像的每一列
        % 依照水印图像的二值去决定要使用哪个加密序列
        if (J(p, q) == 1) % 如果水印图像的当前像素值为1
            k3 = k1; % 使用加密序列k1
        else
            k3 = k2; % 否则使用加密序列k2
        end
        % 计算原图像中块的起始位置
        Ix = (p-1) * K; Iy = (q-1) * K; % 计算当前块的起始坐标
        % 对K*K的块进行二维DCT变换获取频率矩阵
        BLOCK1 = dct2(I(Ix+1:Ix+K, Iy+1:Iy+K)); % 对当前块进行DCT变换
        % 对频率矩阵中的K个固定位置进行加权，加权幅度符合加密序列
        for i = 1:K
            BLOCK1(i, K-i+1) = BLOCK1(i, K-i+1) + alpha * k3(i); % 加权
        end
        % 将加权嵌入后的频率矩阵进行逆二维DCT变换，并赋值到原图，实现水印信息嵌入
        I(Ix+1:Ix+K, Iy+1:Iy+K) = idct2(BLOCK1); % 逆DCT变换并嵌入水印
    end
end
 
% 显示嵌入水印后的图像
subplot(2,2,3); % 选择第三个子图位置
imshow(I); % 显示嵌入水印后的图像
title('嵌入水印后的图像', 'FontSize', 50); % 设置标题
imwrite(I, 'watermarked.jpg', 'jpg'); % 将含水印的图像保存为watermarked.jpg
I = imread('watermarked.jpg'); % 读取含水印的图像
 
% 提取水印算法
W = zeros(N, N); % 初始化提取的水印矩阵
P = zeros(1, K); % 初始化临时存储块的数组
for p = 1:N % 遍历水印图像的每一行
    for q = 1:N % 遍历水印图像的每一列
        % 计算图像分块起始位
        Ix = (p-1) * K; Iy = (q-1) * K; % 计算当前块的起始坐标
        % 对图像分块进行二维DCT变换，得到频率矩阵
        BLOCK2 = dct2(I(Ix+1:Ix+K, Iy+1:Iy+K)); % 对当前块进行DCT变换
        % 对矩阵中固定位置的值进行提取，并将其与加密序列对比。
        for i = 1:K
            P(i) = BLOCK2(i, K-i+1); % 提取固定位置的值
        end
        % 比较与加密序列的相似程度，与k1相似，则代表在水印图像中的灰度值为1，否则为0
        if (corr2(P, k1) > corr2(P, k2)) % 计算相关性
            W(p, q) = 1; % 如果与k1相似，设置提取的水印值为1
        else
            W(p, q) = 0; % 否则设置为0
        end
    end
end
 
% 显示提取的水印
subplot(2,2,4); % 选择第四个子图位置
imshow(W); % 显示提取的水印
titletemp = sprintf('从含水印图像中提取的水印, PSNR:%f', psnr(double(J), W)); % 计算PSNR
title(titletemp, 'FontSize', 25); % 设置标题
 
% ---------- 中值攻击 ---------- %
I1 = imread('watermarked.jpg'); % 读取含水印的图像
I1_red = double(I1(:,:,1)); % 取红色通道
I1_green = double(I1(:,:,2)); % 取绿色通道
I1_blue = double(I1(:,:,3)); % 取蓝色通道
I1_red = medfilt2(I1_red); % 对红色通道进行中值滤波
I1_green = medfilt2(I1_green); % 对绿色通道进行中值滤波
I1_blue = medfilt2(I1_blue); % 对蓝色通道进行中值滤波
% 将中值滤波后的图像合成至彩色图像
I1 = uint8(cat(3, I1_red, I1_green, I1_blue));  
figure(2) % 创建新图形窗口
subplot(1,2,1); % 创建1x2的子图，选择第一个位置
imshow(I1, []); % 显示经过中值攻击的图像
title('中值滤波攻击', 'FontSize', 50); % 设置标题
P1 = zeros(1, K); % 初始化临时存储块的数组
% 提取水印算法
for p = 1:N % 遍历水印图像的每一行
    for q = 1:N % 遍历水印图像的每一列
        Ix = (p-1) * K; Iy = (q-1) * K; % 计算当前块的起始坐标
        BLOCK2 = dct2(I1(Ix+1:Ix+K, Iy+1:Iy+K)); % 对当前块进行DCT变换
        for i = 1:K
            P1(i) = BLOCK2(i, K-i+1); % 提取固定位置的值
            if (corr2(P1, k1) > corr2(P1, k2)) % 计算相关性
                W1(p, q) = 0; % 如果与k1相似，设置提取的水印值为0
            else
                W1(p, q) = 1; % 否则设置为1
            end
        end
    end
end
subplot(1,2,2); % 选择第二个子图位置
imshow(W1); % 显示提取的水印
titletemp = sprintf('从中值滤波图像中提取的水印, PSNR:%f', psnr(W1, double(J))); % 计算PSNR并设置标题
title(titletemp, 'FontSize', 25); % 设置标题
