module top(
	input	 wire [7:0]A		,
	input	 wire [7:0]B		,
	input	 wire [7:0]C		,
	input	 wire [7:0]D		,
	input	 wire [7:0]E		,
	input	 wire [7:0]F		,
	output wire [17:0]out	,
	output wire [27:0]out_extend
);

	wire [8:0]in1;
	wire [8:0]in2;

	add add_1(
		.A		(A),
		.B		(B),
		.out1 (in1)
	);
	
	add add_2(
		.A		(C),
		.B		(D),
		.out1 (in2)
	);
	
	mul mul(
		.in1(in1),
		.in2(in2),
		.out(out)
);

//	=================================  拓展作业  ========================================
	wire [8:0]in3;
	
	add add_3(
		.A		(E),
		.B		(F),
		.out1 (in3)
	);
	
	mul_extend mul_extend(
		.in1(in1),
		.in2(in2),
		.in3(in3),
		.out_extend(out_extend)
);

//	===================================================================================

endmodule