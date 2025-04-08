% ch5example2prg1.m
SNR_in_dB=-10:2:30;
SNR_in=10.^(SNR_in_dB./10); % �ŵ������
m_a=0.3;                    % ���ƶ�
P=0.5+(m_a^2)/4;            % �źŹ���
for k=1:length(SNR_in)
    sigma2=P/SNR_in(k);    % �����ŵ���������������ģ��
    sim('ch5example2.mdl');% ִ�з���
    SNRdemod(k,:)=SNR_out; % ��¼������
end
plot(SNR_in_dB, SNRdemod);
xlabel('��������� dB');
ylabel('����������� dB');
legend('����첨','��ɽ��');