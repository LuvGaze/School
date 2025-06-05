module seg_static(
	
		input wire sys_clk,
		input wire sys_rst_n,

		output wire [5:0] sel, //位选信号
		output reg [7:0] seg //段选信号
		
	);



	parameter T_0_5ms = 32'd24_999_999 ;



	parameter SEG_0 = 8'b0100_0000;
	parameter SEG_1 = 8'b0111_1001;
	parameter SEG_2 = 8'b0010_0100;
	parameter SEG_3 = 8'b0011_0000;
	parameter SEG_4 = 8'b0001_1001;
	parameter SEG_5 = 8'b0001_0010;
	parameter SEG_6 = 8'b0000_0010;
	parameter SEG_7 = 8'b0111_1000;
	parameter SEG_8 = 8'b0000_0000;
	parameter SEG_9 = 8'b0001_0000;
	parameter SEG_A = 8'b0000_1000;
	parameter SEG_B = 8'b0000_0011;
	parameter SEG_C = 8'b0100_0110;
	parameter SEG_D = 8'b0010_0001;
	parameter SEG_E = 8'b0000_0110;
	parameter SEG_F = 8'b0000_1110;
	
	parameter IDLE  = 8'b1111_1111; //取消显示

	
	reg add_flag;
	reg [31:0] cnt_wait;
	reg [7:0] num;//显示的数值

	/////0.5ms cnt
	
	always @ (posedge sys_clk or negedge sys_rst_n)
	begin
		if(!sys_rst_n)
			begin
				cnt_wait <= 32'd0;
			end
		else if(cnt_wait == T_0_5ms)
			begin
				cnt_wait <= 32'd0;
			end
		else
			begin
				cnt_wait <= cnt_wait + 1'b1;
			end
	end


	always @ (posedge sys_clk or negedge sys_rst_n)
	begin
		if(!sys_rst_n)
			begin
				add_flag <= 1'b0;
			end
		else if(cnt_wait == T_0_5ms)
			begin
				add_flag <= 1'b1;
			end
		else
			begin
				add_flag <= 1'b0;
			end
	end



	always @ (posedge sys_clk or negedge sys_rst_n)
	begin
		if(!sys_rst_n)
			begin
				num <= 8'd0;
			end
		else if(add_flag == 1'b1)
			begin
				if(num == 8'd15)
					begin
						num <= 8'd0;
					end
				else
					begin
						num <= num + 1'b1;
					end
			end
	end









	assign sel = 6'b000000 ;


	//将需要显示的数值进行编码/////////////////////
	
	always @ (posedge sys_clk or negedge sys_rst_n)
	begin
		if(sys_rst_n == 1'b0)
			begin
				seg <= IDLE;
			end
		else
			begin
				case(num)
				
					8'd0:  seg <= SEG_0;
					8'd1:  seg <= SEG_1;
					8'd2:  seg <= SEG_2;
					8'd3:  seg <= SEG_3;
					8'd4:  seg <= SEG_4;
					
					8'd5:  seg <= SEG_5;
					8'd6:  seg <= SEG_6;
					8'd7:  seg <= SEG_7;
					8'd8:  seg <= SEG_8;
					8'd9:  seg <= SEG_9;
					
					8'd10: seg <= SEG_A;
					8'd11: seg <= SEG_B;
					8'd12: seg <= SEG_C;
					8'd13: seg <= SEG_D;
					8'd14: seg <= SEG_E;
					8'd15: seg <= SEG_F;
					
					default:seg <= IDLE ; //闲置状态，不显示
					
				endcase
			end
	end





	endmodule