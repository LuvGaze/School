module mul(
	input	 wire [8:0]in1	,
	input	 wire [8:0]in2	,
	output wire [17:0]out
);

	assign out = in1 * in2;

endmodule