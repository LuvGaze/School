t=0:0.001:1;xa=cos(20*pi*t);
Ts=0.01;N1=round(1/Ts);n1=0:N1;x1=cos(20*pi*n1*Ts);
subplot(3,1,1);plot(t,xa,n1*Ts,x1,'o');
ylabel('x_1(n)');title('Sampling of x_a(t) using Ts=0.01');
Ts=0.05;N2=round(1/Ts);n2=0:N2;x2=cos(20*pi*n2*Ts);
subplot(3,1,2);plot(t,xa,n2*Ts,x2,'o');
ylabel('x_2(n)');title('Sampling of x_a(t) using Ts=0.05');
Ts=0.1;N3=round(1/Ts);n3=0:N3;x3=cos(20*pi*n3*Ts);
subplot(3,1,3);plot(t,xa,n3*Ts,x3,'o');
ylabel('x_3(n)');title('Sampling of x_a(t) using Ts=0.1');


