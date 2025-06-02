`timescale 1ns/1ps

module cnt_tb();
	reg clk;
	reg rst_n;
	wire out;
	
	initial begin
		clk = 0;
		rst_n = 0;
		#200
		rst_n = 1;
	end
	
	always #10 clk =~clk;
	
		cnt cnt(
		.clk  (clk),	
		.rst_n(rst_n),	
		.out  (out)	
			
		);


endmodule



