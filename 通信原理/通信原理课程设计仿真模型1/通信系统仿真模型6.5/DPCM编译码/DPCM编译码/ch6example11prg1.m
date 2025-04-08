% ch6example11prg1.m
clear;
p=5;          % 预测器阶数
[x,Fs,bits] = wavread('GDGvoice8000.wav');
r = xcorr(x); % 自相关函数
r=r/max(r);   % 归一化
r=r(length(x):length(x)+p);% 自相关系数序列[r0,r1,...rp]
R=r(2:p+1);
C=toeplitz(r(1:p));
W=inv(C)*R;              % 计算最佳抽头系数
W=[0;W]'                 % 计入FIR滤波器第一个抽头系数W0
predictor = dpcmopt(x,p) % 利用通信工具箱中函数直接计算