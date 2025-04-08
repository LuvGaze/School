% ch5example2prg1.m
SNR_in_dB=-10:2:30;
SNR_in=10.^(SNR_in_dB./10); % 信道信噪比
m_a=0.3;                    % 调制度
P=0.5+(m_a^2)/4;            % 信号功率
for k=1:length(SNR_in)
    sigma2=P/SNR_in(k);    % 计算信道噪声方差并送入仿真模型
    sim('ch5example2.mdl');% 执行仿真
    SNRdemod(k,:)=SNR_out; % 记录仿真结果
end
plot(SNR_in_dB, SNRdemod);
xlabel('输入信噪比 dB');
ylabel('解调输出信噪比 dB');
legend('包络检波','相干解调');