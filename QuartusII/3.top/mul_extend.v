module mul_extend(
	input	 wire [8:0]in1	,
	input	 wire [8:0]in2	,
	input	 wire [8:0]in3	,
	output wire [27:0]out_extend
);

	assign out_extend = in1 * in2 * in3;

endmodule