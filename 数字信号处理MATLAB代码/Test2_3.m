N=100;n=0:N-1;
xn=2*sin(0.48*pi*n)+cos(0.52*pi*n);
XK=fft(xn,N);
magXK=abs(XK);phaXK=angle(XK);
subplot(2,1,1),plot(n,xn),xlabel('n');ylabel('x(n)');title('x(n) N=100')
subplot(2,1,2)
k=0:length(magXK)-1;
stem(k,magXK, '.');
xlabel('k');ylabel('|X(k)|');title('X(k) N=100');
