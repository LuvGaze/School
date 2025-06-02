module cnt (
	input  wire clk  ,			//时钟信号，50MHz
	input  wire rst_n,			//复位信号，低电平有效
	//output wire out				//组合逻辑输出信号
	output reg out					//时序逻辑输出信号
);
	reg [7:0]cnt;					//0-20循环计数
	
	always @(posedge clk or negedge rst_n)begin
		if (~rst_n)					//if括号内只有一个变量默认变量为1
			cnt <= 8'd0;
		else if (cnt == 8'd20)
			cnt <=8'd0;
		else
			cnt <= cnt+8'd1;
	end
	
		//组合逻辑
		/*
		assign out = (cnt >= 8'd10 && cnt <= 8'd15) ? 1:0;
		*/
		
		//时序逻辑
		
		always @(posedge clk or negedge rst_n) begin
			if(~rst_n)
				out <= 8'd0;
			else if(cnt >=8'd9 && cnt <= 8'd14)
				out <= 8'd1;
			else 
				out <= 8'd0;
		end
		
		
endmodule