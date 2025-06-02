module XULIE_CHECK(
	input  wire clk    ,					//时钟信号，50MHz
	input  wire rst_n  ,					//复位信号
	input  wire data_in,					//连续的数据流
	output reg  find_ok 					//从连续的数据流中检测刀10010后拉高

);

	//定义状态变量
	
	reg [5:0]state;
	
	//使用独热码编码
	parameter IDLE = 6'b000_001;
	parameter S0   = 6'b000_010;
	parameter S1   = 6'b000_100;	
	parameter S2   = 6'b001_000;
	parameter S3   = 6'b010_000;	
	parameter S4   = 6'b100_000;
	
	
	//二段式状态机
	//第一段，使用时序逻辑描述状态转移
	
	always @ (posedge clk or negedge rst_n) begin
		if(~rst_n)
			state <= IDLE;
		else case (state)
		
			IDLE : begin
				if(data_in)
					state <= S0;
				else
					state <= IDLE;
			end
		
			S0 : begin 
			if (data_in)
					state <= S0;
				else
					state <= S1;
			end
			
			S1 : begin
				if(data_in)
					state <= S0;
				else
					state <= S2;
			end
			
			S2 : begin
				if(data_in)
					state <= S3;
				else
					state <= IDLE;
			end
			
			
			S3 : begin
				if(data_in)
					state <= S0;
				else
					state <= S4;
			end
				
				
			S4 : begin 									//Moore状态机 非重复检测
				if(data_in)
					state <= S0;
				else
					state <= IDLE;
			end
			
			
			default : begin
				state <= IDLE;
			end
		endcase
	end
	
	
	//d第二段，使用时序逻辑描述输出
	
	always @ (posedge clk or negedge rst_n) begin
		if(~rst_n)
			find_ok <= 0;
		else if(state == S4)
			find_ok <= 1;
		else
			find_ok <= 0;
	end

endmodule




