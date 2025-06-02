% 读取原始图像并缩小分辨率
I = imread('image.jpg');
if size(I, 3) == 3
    I = rgb2gray(I); % 转换为灰度图像
end
original_image = imresize(I, [512, 512]); % 缩小到 512x512

% 获取图像尺寸
[rows, cols] = size(original_image);

% 定义块大小
K = 8;

% 计算分块的数量
num_blocks_row = floor(rows / K);
num_blocks_col = floor(cols / K);

% 限制显示的小块数量
max_blocks_row = min(num_blocks_row, 8);
max_blocks_col = min(num_blocks_col, 8);

% 创建一个新的空白图像用于拼接分块
display_image = uint8(zeros(max_blocks_row * K, max_blocks_col * K));

for p = 1:max_blocks_row
    for q = 1:max_blocks_col
        % 提取当前 8x8 小块
        block = original_image((p-1)*K+1:p*K, (q-1)*K+1:q*K);
        
        % 将小块拼接到 display_image 中
        display_image((p-1)*K+1:p*K, (q-1)*K+1:q*K) = block;
    end
end

% 显示原图和分块处理后的图像
figure;

% 原图
subplot(1, 2, 1);
imshow(original_image, []);
title('原始图像','FontSize', 50);
axis off;

% 分块处理后的图像
subplot(1, 2, 2);
imshow(display_image, []);
title('8x8 分块','FontSize', 50);
axis off;