`timescale 1ns/1ps
module cola_tb ();

	reg     clk     ;
	reg     rst_n   ;
	reg[1:0]in_m    ;	 
	reg     give_up ;	 

	wire     out_cola;
	wire[4:0]out_m   ;
	 
	 
	 
   initial begin
		clk = 0;
		rst_n = 0;
		in_m = 0;
		give_up = 0;
		#200
		rst_n = 1;
		
   end

    always #10 clk = ~clk;
    always #40 in_m = {$random} %3;  
    always #40 give_up = {$random} %2;

	
	cola cola (
		.clk     (clk),	
		.rst_n   (rst_n),

		.in_m    (in_m),
		.give_up (give_up),

		.out_cola(out_cola),
		.out_m   (out_m)
	
	);
	
endmodule