module add(
	input	 wire [7:0]A		,
	input	 wire [7:0]B		,
	output wire [8:0]out1
);

	assign out1 = A + B;

endmodule