x=[1,3,5,3,1];nx=0:4;T=0.5;					% 给定原始数据
N=length(x);D=2*pi/(N*T);					% 求出序列长度及频率分辨率
k=floor((-(N-1)/2):((N-1)/2)); 				% 求对称于零频率的FFT位置向量
X=fftshift(fft(x,N));					        % 求对称于零频率的FFT序列值
subplot(2,1,1),plot(k*D,abs(X),'o:')		    % 画幅频特性图
subplot(2,1,2),plot(k*D,angle(X),'o:')		    % 画相频特性图
