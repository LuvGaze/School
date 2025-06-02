module cola (
   input  wire      clk     ,  		//时钟信号，50MHz
   input  wire      rst_n   ,  		//复位信号，低电平有效
	 
	input  wire [1:0]in_m    ,  		//01：投0.5 10：投1
	input  wire      give_up ,			//退钱
		
	output reg       out_cola,			//出可乐
	output reg  [4:0]out_m    			//0：不出钱，1：出0.5元，2：出1元....
	
);



	 reg [5:0]state;
    parameter IDLE = 6'd0;
    parameter S0   = 6'd1;
    parameter S1   = 6'd2;
    parameter S2   = 6'd3;
    parameter S3   = 6'd4;
    parameter S4   = 6'd5;
    parameter S5   = 6'd6;

	//二段式状态机
	
	//第一段，使用时序逻辑描述状态转移
	always @ (posedge clk or negedge rst_n) begin
		if (~rst_n)
			state <= IDLE;
		else case (state)
				IDLE : begin
					if (give_up)
						state <= IDLE;
					else begin
						if(in_m == 2'b01)
							state <= S0;
						else if(in_m == 2'b10)
							state <= S1;
						else
							state <= state;
					end
				end
				
				
				S0 : begin
					if (give_up)
						state <= IDLE;
					else begin
						if(in_m == 2'b01)
							state <= S1;
						else if(in_m == 2'b10)
							state <= S2;
						else
							state <= state;
					end
				end
				
				
				S1 : begin
					if (give_up)
						state <= IDLE;
					else begin
						if(in_m == 2'b01)
							state <= S2;
						else if(in_m == 2'b10)
							state <= S3;
						else
							state <= state;
					end
				end
				
				
				S2 : begin
					if (give_up)
						state <= IDLE;
					else begin
						if(in_m == 2'b01)
							state <= S3;
						else if(in_m == 2'b10)
							state <= S4;
						else
							state <= state;
					end
				end
				
				
				S3 : begin
					if (give_up)
						state <= IDLE;
					else begin
						if(in_m == 2'b01)
							state <= S4;
						else if(in_m == 2'b10)
							state <= S5;
						else
							state <= state;
					end
				end
				
				
				S4 : begin
					if (give_up)
						state <= IDLE;
					else begin
						if(in_m == 2'b01)
							state <= S5;
						else if(in_m == 2'b10)
							state <= IDLE;
						else
							state <= state;
					end
				end
				
				
				S5 : begin
					if (give_up)
						state <= IDLE;
					else begin
						if(in_m == 2'b01)
							state <= IDLE;
						else if(in_m == 2'b10)
							state <= IDLE;
						else
							state <= state;
					end
				end
				
				
				default : begin
					state <= IDLE;
				end
			endcase
	end
	
	//第二段，使用时序逻辑描述输出
	always @ (posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			out_cola <= 0;
			out_m    <= 5'd0;
		end
			
		else case(state)
			IDLE : begin
			out_cola <= 0;
			out_m    <= 5'd0;
			end
			
			
			S0 : begin
				if(give_up)begin
					out_cola <= 0;
					out_m    <= 5'd1;

				end
				else begin
					out_cola <= 0;
					out_m    <= 5'd0;
				end
			end
			
		
			S1 : begin
				if(give_up)begin
					out_cola <= 0;
					out_m    <= 5'd2;

				end
				else begin
					out_cola <= 0;
					out_m    <= 5'd0;
				end
			end
			
		
			S2 : begin
				if(give_up)begin
					out_cola <= 0;
					out_m    <= 5'd3;

				end
				else begin
					out_cola <= 0;
					out_m    <= 5'd0;
				end
			end
		
		
			S3 : begin
				if(give_up)begin
					out_cola <= 0;
					out_m    <= 5'd4;

				end
				else begin
					out_cola <= 0;
					out_m    <= 5'd0;
				end
			end
			
			
			S4 : begin
				if(give_up)begin
					out_cola <= 0;
					out_m    <= 5'd5;
				end
				else if(in_m == 2'b10)begin
					out_cola <= 1;
					out_m    <= 5'd0;
				end
				else if(in_m == 2'b01)begin
					out_cola <= 0;
					out_m    <= 5'd0;
				end
				else begin
					out_cola <= 0;
					out_m    <= 5'd0;
				end
			end
				
			S5 : begin
				if(give_up)begin
					out_cola <= 0;
					out_m    <= 5'd6;

				end
				else if(in_m == 2'b01)begin
					out_cola <= 1;
					out_m    <= 5'd0;
				end
				else if(in_m == 2'b10)begin
					out_cola <= 1;
					out_m    <= 5'd1;
				end
				else begin
					out_cola <= 0;
					out_m    <= 5'd0;
				end
			end
			
			default : begin
				out_cola <= 0;
				out_m    <= 5'd0;
			end
			
		endcase
		
	end




endmodule



