% 设置参数
N = 8; % 序列长度，必须是2的幂
Fs = 16; % 采样频率
T = 1/Fs; % 采样周期
f = 5; % 正弦波频率
t = (0:N-1)*T; % 时间向量

% 生成正弦波数据源
x = sin(2*pi*f*t);

% 使用fft函数进行快速傅里叶变换
X = fft(x);

% 计算频率轴
f_axis = (-N/2:N/2-1)*(Fs/N);
% 由于fft结果是对称的，且通常我们只关心0到Nyquist频率的部分，
% 所以可以只取前一半加直流分量（对于偶数长度序列，中间点可以省略或单独处理）
% 但为了展示完整性，这里保留全部N点

% 使用ifft函数进行逆快速傅里叶变换
x_reconstructed = ifft(X);

% 绘制结果
figure;

% 时域信号
subplot(3,1,1);
stem(t, x, 'filled');
title('时域信号 (正弦波)');
xlabel('时间 (s)');
ylabel('幅值');
grid on;

% 频域信号（幅度谱）
subplot(3,1,2);
stem(f_axis, abs(X)/N, 'filled'); % 归一化幅度
title('频域信号 (幅度谱)');
xlabel('频率 (Hz)');
ylabel('幅度');
xlim([-Fs/2 Fs/2]); % 限制频率范围
grid on;

% 反演回的时域信号
subplot(3,1,3);
stem(t, real(x_reconstructed), 'filled'); % 只取实部，因为原始信号是实数
title('反演回的时域信号');
xlabel('时间 (s)');
ylabel('幅值');
grid on;

% 保存截图
saveas(gcf, 'fft_experiment_result.png');
