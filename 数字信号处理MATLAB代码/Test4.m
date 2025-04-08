function st=mstg
%产生信号st，并显示st的时域波形和频谱
%st=mstg返回混合信号，长度N=160
N=1600                                      %长度
Fs=10000;T=1/Fs;Tp=N*T;                     %采样频率Fs=10KHz,Tp为采样时间
t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
fc1=Fs/10;                                  %第1路调幅信号的载波频率fc1=1000Hz?
fm1=fc1/10;                                 %第1路调幅信号的调制信号频率fm1=100Hz
fc2=Fs/20;                                  %第2路调幅信号的载波频率fc2=500Hz??
fm2=fc2/10;                                 %第2路调幅信号的调制信号频率fm2=50Hz
fc3=Fs/40;                                  %第3路调幅信号的载波频率fc3=250Hz?
fm3=fc3/10;                                 %第3路调幅信号的调制信号频率fm3=25Hz
xt1=cos(2*pi*fm1*t).*cos(2*pi*fc1*t);       %产生第1路调幅信号?
xt2=cos(2*pi*fm2*t).*cos(2*pi*fc2*t);       %产生第2路调幅信号
xt3=cos(2*pi*fm3*t).*cos(2*pi*fc3*t);       %产生第3路调幅信号???
st=xt1+xt2+xt3;                             %三路调幅信号相加
fxt=fft(st,N);                              %计算信号st的频谱

%===============绘图部分============
figure(1)
subplot(2,1,1)
plot(t,st);grid;xlabel('t/s');ylabel('s(t)');
axis([0,Tp/8,min(st),max(st)]);title('(a)s(t)的波形')
subplot(2,1,2)
stem(f,abs(fxt)/max(abs(fxt)),'.');grid,title('(b) s(t)的频谱');
axis([0,Fs/5,0,1.2]);
xlabel('f/Hz');ylabel('幅度')
Fs=10000;T=1/Fs;                            %采样频率Fs=10KHz,Tp为采样时间
fp=450;fs=275;Rp=0.1;As=60;                 %设置参数
wp=2*fp/Fs;ws=2*fs/Fs;                      %WP，WS是通带截止频率，阻带截止频率的归一化值
[N,wpo]=ellipord(wp,ws,Rp,As);
[B,A]=ellip(N,Rp,As,wpo);
y3t=filter(B,A,st);

%=========绘图=============
figure(2);
[H,W]=freqz(B,A,1000);                      %[h，w] = freqz（b，a，n）返回数字滤波器的n点频率响应矢量h和相应的角频率矢量w，其中分子和分母多项式系数分别存储在b和a中。
m=abs(H);
plot(W/pi,20*log(m/max(m)));grid on;title('低通滤波损耗函数曲线');
xlabel('w/pi');
ylabel('幅度');
% axis([0,1,0,1.2*max(H)])
% % yt='y3(t)';
figure(3);
plot(t,y3t);title('低通滤波后的波形');
xlabel('t/s');ylabel('y3(t)');
Fs=10000;T=1/Fs;                            %采样频率Fs=10KHz,Tp为采样时间
fpl=440;fpu=560;fsl=275;fsu=900;rp=0.1;rs=60;
wp=[2*fpl/Fs,2*fpu/Fs];ws=[2*fsl/Fs,2*fsu/Fs];
[N,wp]=ellipord(wp,ws,rp,rs);
[B,A]=ellip(N,rp,rs,wp);
y2t=filter(B,A,st);
figure(4);
[H,w]=freqz(B,A,1000);                      %[h，w] = freqz（b，a，n）返回数字滤波器的n点频率响应矢量h和相应的角频率矢量w，其中分子和分母多项式系数分别存储在b和a中。
m=abs(H);
plot(w/pi,20*log(m/max(m)));
grid on;title('带通滤波损耗函数曲线');
xlabel('w/pi');ylabel('幅度'); 
figure(5);
t=0:T:(length(y2t)-1)*T;
plot(t,y2t);
Fs=10000;T=1/Fs;                            %采样频率Fs=10KHz,Tp为采样时间
fp=890;fs=600;Rp=0.1;As=60;                 %设置参数
wp=2*fp/Fs;ws=2*fs/Fs;                      %WP，WS是通带截止频率，阻带截止频率的归一化值
[N,wpo]=ellipord(wp,ws,Rp,As);
[B,A]=ellip(N,Rp,As,wpo,'high');
y3t=filter(B,A,st);

%=========绘图=============
figure(6);
[H,W]=freqz(B,A,1000);                      %[h，w] = freqz（b，a，n）返回数字滤波器的n点频率响应矢量h和相应的角频率矢量w，其中分子和分母多项式系数分别存储在b和a中。
m=abs(H);
plot(W/pi,20*log(m/max(m)));grid on;title('高通滤波损耗函数曲线');
xlabel('w/pi');
ylabel('幅度');
% axis([0,1,0,1.2*max(H)])
% % yt='y3(t)';
figure(7);
plot(t,y3t);title('高通滤波后的波形');
