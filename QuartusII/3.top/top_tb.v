`timescale 1ns/1ps

module  top_tb();
	reg	[7:0]A	;
   reg	[7:0]B	;
   reg	[7:0]C	;
   reg	[7:0]D	;
	reg	[7:0]E	;
   reg	[7:0]F	;
	wire	[17:0]out;
	
	initial begin
		A = 8'd52	;
		B = 8'd125	;
		C = 8'd100	;
		D = 8'd98	;
		E = 8'd20	;
		F = 8'd15	;
		#200
		
		A = 8'd48	;
		B = 8'd201	;
		C = 8'd66	;
		D = 8'd54	;
		E = 8'd99	;
		F = 8'd52	;
		#200
		
		A = 8'd86	;
		B = 8'd114	;
		C = 8'd126	;
		D = 8'd88	;
		E = 8'd123	;
		F = 8'd81	;
		#200
		$stop;
		
	end
		top top(
			.A		(A),
			.B		(B),
			.C		(C),
			.D		(D),
			.E		(E),
			.F		(F),
			.out	(out)
		);
		
	
	
endmodule