
module select(
	input  wire [1:0] in1,
	input  wire [1:0] in2,
	input  wire [1:0] in3,
	input  wire [1:0] in4,
	input  wire [1:0] sel,
	output reg  [1:0 ]out
);

	always @ (*) begin
		case (sel)
			0: out = in1;
         1: out = in2;
         2: out = in3;
         3: out = in4;
			default: out = 0;
		endcase
	end
	
endmodule
