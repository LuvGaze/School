% ch7example6prog1.m
                                               % AMI码的编码
xn=[1 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0];% 输入单极性码
yn=xn;% 输出yn初始化
num=0;% 计数器初始化
for k=1:length(xn)
   if xn(k)==1
      num=num+1;                % "1"计数器
         if num/2 == fix(num/2) % 奇数个1时输出-1,进行极性交替
              yn(k)=1;
         else
              yn(k)=-1;
         end
    end
end
        % HDB3编码
num=0;  % 连零计数器初始化
yh=yn;  % 输出初始化
sign=0; % 极性标志初始化为0
V=zeros(1,length(yn));% V脉冲位置记录变量 
B=zeros(1,length(yn));% B脉冲位置记录变量
for k=1:length(yn)
   if yn(k)==0
       num=num+1;  % 连“0”个数计数
       if num==4   % 如果4连“0”
         num=0;    % 计数器清零
         yh(k)=1*yh(k-4); 
                            % 让0000的最后一个0改变为与前一个非零符号相同极性的符号
         V(k)=yh(k);        % V脉冲位置记录
         if yh(k)==sign     % 如果当前V符号与前一个V符号的极性相同
            yh(k)=-1*yh(k); % 则让当前V符号极性反转,以满足V符号间相互极性反转要求
            yh(k-3)=yh(k);  % 添加B符号,与V符号同极性
            B(k-3)=yh(k);   % B脉冲位置记录
            V(k)=yh(k);     % V脉冲位置记录
            yh(k+1:length(yn))=-1*yh(k+1:length(yn));
                            % 并让后面的非零符号从V符号开始再交替变化
         end
       sign=yh(k);          % 记录前一个V符号的极性
     end
  else
      num=0;                % 当前输入为“1”则连“0”计数器清零
  end
end                         % 编码完成
re=[xn',yn',yh',V',B'];     % 结果输出: xn AMI HDB3 V&B符号
                            % HDB3解码
input=yh;                   % HDB3码输入
decode=input;               % 输出初始化
sign=0;                     % 极性标志初始化
for k=1:length(yh)
    if input(k) ~= 0
       if sign==yh(k)       % 如果当前码与前一个非零码的极性相同
          decode(k-3:k)=[0 0 0 0];% 则该码判为V码并将*00V清零
       end
       sign=input(k);       % 极性标志
    end
end
decode=abs(decode);         % 整流
error=sum([xn'-decode']);   % 解码的正确性检验,作图
subplot(3,1,1);stairs([0:length(xn)-1],xn);axis([0 length(xn) -2 2]);
subplot(3,1,2);stairs([0:length(xn)-1],yh);axis([0 length(xn) -2 2]);
subplot(3,1,3);stairs([0:length(xn)-1],decode);axis([0 length(xn) -2 2]);