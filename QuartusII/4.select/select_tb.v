`timescale 1ns/1ps

module select_tb();

reg in1, in2, in3, in4;
reg [1:0] sel;
wire out;
	
	initial begin
		in1 = 0;
		in2 = 1;
		in3 = 0;
		in4 = 1;
		sel = 2'b11;
	end
	//生成随机数 ($random) %n 生成随机数的范围是0~n-1
	
	always #20 sel = ($random) %4;		//每隔20ns生成一个随机数
	
	select select(
		.in1(in1),
		.in2(in2),
		.in3(in3),
		.in4(in4),
		.sel(sel),
		.out(out)

	);
	
endmodule
