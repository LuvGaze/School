% ch6example11prg1.m
clear;
p=5;          % Ԥ��������
[x,Fs,bits] = wavread('GDGvoice8000.wav');
r = xcorr(x); % ����غ���
r=r/max(r);   % ��һ��
r=r(length(x):length(x)+p);% �����ϵ������[r0,r1,...rp]
R=r(2:p+1);
C=toeplitz(r(1:p));
W=inv(C)*R;              % ������ѳ�ͷϵ��
W=[0;W]'                 % ����FIR�˲�����һ����ͷϵ��W0
predictor = dpcmopt(x,p) % ����ͨ�Ź������к���ֱ�Ӽ���