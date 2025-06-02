`timescale 1ns/1ps


module d_flip_flop_tb();
	reg clk;
	reg rst_n;
	reg D;
	wire Q;


	initial begin
		clk = 0;
		rst_n = 0;
		D = 0;
		#200
		rst_n = 1;
		#25
		D = 1;
		//毛刺
		#27
		D = 0;
		#2
		D = 1;
		#2
		D = 0;
		#2
		D = 1;
		#2
		D = 0;
		#2
		D = 1;
		//
		#40
		D = 0;
		#100
		$stop;

	end

	always #10 clk = ~clk;
	
	
	d_flip_flop d_flip_flop(
		.clk  (clk),			//时钟信号，频率为50Hz
		.rst_n(rst_n),			//复位信号，低电平有效
		.D    (D),			//输入信号
		.Q    (Q)			//输出信号
	 
	);

endmodule