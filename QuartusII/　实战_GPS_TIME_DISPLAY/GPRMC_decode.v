module GPRMC_decode(

	input wire sys_clk		,		//工作时钟，频率 50MHz

	input wire sys_rst_n	,		//复位信号，低电平有效
	
	input wire [7:0] po_data,		//接收串口模块还原的 8bit 数据
	input wire po_flag		,		//接收串口模块还原的 8bit 数据的有效标志信号
		
	output reg [19:0] final_time	//解析出来的当前时间信息
									//例如 112233 代表11时22分33秒

);

//数据结构帧头对应的ASCII码
localparam FRAME_START	= 8'h24;  				//ASCII码 $ 的16进制表示
localparam FRAME_TYPE 	= 40'h47_50_52_4d_43; 	//GPRMC 对应ASCII码

//状态机编码
reg [7:0] state;
parameter IDLE	= 8'd0	;
parameter S0	= 8'd1	;
parameter S1	= 8'd2	;
parameter S2	= 8'd3	;
parameter S3	= 8'd4	;
parameter S4	= 8'd5	;
parameter S5	= 8'd6	;
parameter S6	= 8'd7	;
parameter S7	= 8'd8	;
parameter S8	= 8'd9	;
parameter S9	= 8'd10	;
parameter S10	= 8'd11	;





always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			state <= IDLE;
		end 
	else 	
		begin 
			case(state)
				IDLE: //($)
					begin 
						if(po_flag && (po_data == FRAME_START))//$
							begin 
								state <= S0;
							end 
						else 
							begin 
								state <= IDLE;
							end 
					end 
				
				S0:	//$(G)
					begin 
						if(po_flag && (po_data == FRAME_TYPE[39:32]))//G
							begin 
								state <= S1;
							end 
						else if(po_flag && (po_data == FRAME_START))//$
							begin 
								state <= S0;
							end 
						else 
							begin 
								state <= state;
							end 
					end 
				
				S1: //$G(P)
					begin 
						if(po_flag && (po_data == FRAME_TYPE[31:24]))//P
							begin 
								state <= S2;
							end 
						else if(po_flag && (po_data == FRAME_START))//$
							begin 
								state <= S0;
							end 
						else 
							begin 
								state <= state;
							end 
					end 
					
				S2: //$GP(R)
					begin 
						if(po_flag && (po_data == FRAME_TYPE[23:16]))//R
							begin 
								state <= S3;
							end 
						else if(po_flag && (po_data == FRAME_START))//$
							begin 
								state <= S0;
							end 
						else 
							begin 
								state <= state;
							end 
					end 
					
				S3: //$GPR(M)
					begin 
						if(po_flag && (po_data == FRAME_TYPE[15:8]))//M
							begin 
								state <= S4;
							end 
						else if(po_flag && (po_data == FRAME_START))//$
							begin 
								state <= S0;
							end 
						else 
							begin 
								state <= state;
							end 
					end 
					
				S4: //$GPRM(C)
					begin 
						if(po_flag && (po_data == FRAME_TYPE[7:0]))//C
							begin 
								state <= S5;
							end 
						else if(po_flag && (po_data == FRAME_START))//$
							begin 
								state <= S0;
							end 
						else 
							begin 
								state <= state;
							end 
						end 	
					
				S5:	//$GPRMC检测成功，提取有效数据，在数据结构里的*到来之前保持在此状态
					begin 
						if(po_flag && (po_data == 8'h2a))//*
							begin 
								state <= S6;
							end 
						else if(po_flag && (po_data == FRAME_START))//$
							begin 
								state <= S0;
							end 
						else 
							begin 
								state <= state;
							end 
					end 
					
				S6://接收第1个校验值的ASCII码
					begin 
						if(po_flag)
							begin 
								state <= S7;
							end 
						else 
							begin 
								state <= state;
							end 
					end 
				
				S7://接收第2个校验值的ASCII码
					begin 
						if(po_flag)
							begin 
								state <= S8;
							end 
						else 
							begin 
								state <= state;
							end 
					end 
					
				S8://将异或计算的两个的校验值均转换为对应的ASCII码
					begin 
						state <= S9;
					end 
				
				S9://校验比对
					begin 
						state <= S10;
					end 
					
				S10://定位有效且校验正确，锁定时间信息，准备送往数码管
					begin 
						state <= IDLE;
					end 

			endcase 
		end 
end 

//数据帧结构 $GPRMC,<1>,<2>,<3>,<4>,<5>,<6>,<7>,<8>,<9>,<10>,<11>,<12>*hh 

//逗号计数器，定位有效信息区段，获取对应位置有效信息
reg [7:0] comma_cnt;	//逗号计数器

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			comma_cnt <= 8'd0;
		end 
	else if(po_flag && (po_data == FRAME_START))
		begin 
			comma_cnt <= 8'd0;
		end 
	else if(po_flag && (po_data == 8'h2c))//逗号
		begin 
			comma_cnt <= comma_cnt + 1'b1;
		end 
end 



//程序接收进行的异或校验结果 
reg [7:0] xor_result		;	//从$到*之间的所有数据依次进行异或
reg [7:0] xor_result_latch	;	//从$到*之间的所有数据异或结果

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			xor_result 			<= 8'h0	;
			xor_result_latch	<= 8'd0	;
		end 
	else if(po_flag && (po_data == FRAME_START))//$ 
		begin 
			xor_result 	<= 8'h0	;
		end
	else if(po_flag && (po_data == 8'h2a))//*
		begin 
			xor_result 			<= xor_result	;
			xor_result_latch	<= xor_result	; 
		end 
	else if(po_flag)
		begin 
			xor_result		<= xor_result ^ po_data	;
		end 
end 


//校验译码
//将两位的校验值均转换为对应的ASCII码
reg [7:0] ascii_xor1;	//异或运算得到的高位的校验值
reg [7:0] ascii_xor2;	//异或运算得到的低位的校验值

//异或结果的高位数值转换成ASCII码
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			ascii_xor1 <= 8'h0;
		end 
	else if(state == IDLE)
		begin 
			ascii_xor1 <= 8'h0;
		end 
	else if(state == S8)
		begin 
			case(xor_result_latch[7:4])
					4'h0 : ascii_xor1 <= 8'h30;
					4'h1 : ascii_xor1 <= 8'h31;
					4'h2 : ascii_xor1 <= 8'h32;
					4'h3 : ascii_xor1 <= 8'h33;
					4'h4 : ascii_xor1 <= 8'h34;
					4'h5 : ascii_xor1 <= 8'h35;
					4'h6 : ascii_xor1 <= 8'h36;
					4'h7 : ascii_xor1 <= 8'h37;
					4'h8 : ascii_xor1 <= 8'h38;
					4'h9 : ascii_xor1 <= 8'h39;
					4'ha : ascii_xor1 <= 8'h41;
					4'hb : ascii_xor1 <= 8'h42;
					4'hc : ascii_xor1 <= 8'h43;
					4'hd : ascii_xor1 <= 8'h44;
					4'he : ascii_xor1 <= 8'h45;
					4'hf : ascii_xor1 <= 8'h46;
				default  : ascii_xor1 <= 8'h00;
			endcase 
		end 
end 

//异或结果的低位数值转换成ASCII码
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			ascii_xor2 <= 8'h0;
		end 
	else if(state == IDLE)
		begin 
			ascii_xor2 <= 8'h0;
		end 
	else if(state == S8)
		begin 
			case(xor_result_latch[3:0])
				  4'h0 : ascii_xor2 <= 8'h30;
				  4'h1 : ascii_xor2 <= 8'h31;
				  4'h2 : ascii_xor2 <= 8'h32;
				  4'h3 : ascii_xor2 <= 8'h33;
				  4'h4 : ascii_xor2 <= 8'h34;
				  4'h5 : ascii_xor2 <= 8'h35;
				  4'h6 : ascii_xor2 <= 8'h36;
				  4'h7 : ascii_xor2 <= 8'h37;
				  4'h8 : ascii_xor2 <= 8'h38;
				  4'h9 : ascii_xor2 <= 8'h39;
				  4'ha : ascii_xor2 <= 8'h41;
				  4'hb : ascii_xor2 <= 8'h42;
				  4'hc : ascii_xor2 <= 8'h43;
				  4'hd : ascii_xor2 <= 8'h44;
				  4'he : ascii_xor2 <= 8'h45;
				  4'hf : ascii_xor2 <= 8'h46;
				  default : ascii_xor2 <= 8'h00;
			endcase 
		end 
end 





//校验比对，校验是否正确
reg xor_right;

//接收2个字节的校验值
reg	[7:0] first_byte_xor	;	//接收的第1个字节的校验值
reg [7:0] second_byte_xor	;	//接收的第2个字节的校验值

//在s6状态接收第一个校验值对应ASCII码
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			first_byte_xor <= 8'h0;
		end 
	else if(po_flag && (state == S6))
		begin 
			first_byte_xor <= po_data;
		end 
	else 
		begin 
			first_byte_xor <= first_byte_xor;
		end 
end 
//在s7状态接收第二个校验值对应ASCII码
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			second_byte_xor <= 8'h0;
		end 
	else if(po_flag && (state == S7))
		begin 
			second_byte_xor <= po_data;
		end 
	else 
		begin 
			second_byte_xor <= second_byte_xor; 
		end 
end 

//在s9状态进行校验
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			xor_right <= 1'b0;
		end 
	else if(state == IDLE)
		begin 
			xor_right <= 1'b0;
		end 
	else if((state == S9) && ({first_byte_xor,second_byte_xor} == {ascii_xor1,ascii_xor2}))
		begin 
			xor_right <= 1'b1;
		end 
end 




////捕获时间信息   例：152344 （hhmmss）  时间：15时23分44秒

reg [7:0]  tmp_cnt;	//时间信息位计数器
reg [47:0] tmp_hms;	//时间信息寄存器


//数据帧结构里第一个“，”之后，字段<1>开始的数据对其进行编号，编号前6位具有效时间信息（hhmmss）
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			tmp_cnt <= 8'd0;
		end 
	else if(po_flag && (state == S5) && (comma_cnt == 8'd1))	//给第一个“，”后的每个字节数据依次编号
		begin 
			tmp_cnt <= tmp_cnt + 1'b1;
		end 
	else  if(state == IDLE)
		begin 
			tmp_cnt <= 8'd0;
		end 
end 

//获取字段<1>里前6位对应位的时间具体值（hhmmss）
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			tmp_hms <= 48'd0;
		end 
	else if(po_flag && (state == S5) && (comma_cnt == 8'd1))
		begin 
			case(tmp_cnt)
				8'd0: tmp_hms[47:40] <= po_data;	//时十位（ASCII码）
				8'd1: tmp_hms[39:32] <= po_data;	//时个位（ASCII码）
				8'd2: tmp_hms[31:24] <= po_data;    //分十位（ASCII码）
				8'd3: tmp_hms[23:16] <= po_data;    //分个位（ASCII码）
				8'd4: tmp_hms[15:8]	 <= po_data;    //秒十位（ASCII码）
				8'd5: tmp_hms[7:0]   <= po_data;    //秒个位（ASCII码）
				default : tmp_hms    <= tmp_hms;
			endcase 
		end 
end 





///捕获定位是否有效  A=有效定位，V=无效定位

reg [7:0] dingwei_status		;	//定位数据存储器
reg [7:0] dingwei_receive_cnt	;	//

//数据帧结构里第二个“，”后，字段<2>开始的数据依次编号计数器
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			dingwei_receive_cnt <= 8'd0;
		end 
	else if(po_flag && (state == S5) && (comma_cnt == 8'd2)) //给第二个“，”后的每个字节数据依次编号
		begin 
			dingwei_receive_cnt <= dingwei_receive_cnt + 1'b1;
		end 
	else if(state == IDLE)
		begin 
			dingwei_receive_cnt <= 8'd0;
		end 
end 
//数据结构里第二个“，”后跟着的第0号位数据为定位信息  
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			dingwei_status <= 8'd0;
		end 
	else if(po_flag && (state == S5) && (comma_cnt == 8'd2) && (dingwei_receive_cnt == 8'd0))
												//数据帧结构第二个“，”后，字段<2>第一个数据为定位信息
		begin 
			dingwei_status <= po_data;
		end 
end 




//如果定位有效且校验正确，则锁定时间信息，准备送往数码管

reg [47:0] tmp_hms_valid;	//有效时间寄存器

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			tmp_hms_valid <= 48'd0;
		end 
	else if((state == S10) && (dingwei_status == 8'h41)) //定位=A（成功定位）
		begin 
			tmp_hms_valid <= tmp_hms;	
		end 
	else 
		begin 
			tmp_hms_valid <= tmp_hms_valid;
		end 
end 


//由于系统开始工作时，最开始接收到的信号可能有不稳定的因素产生，所以丢弃系统刚启动时携带的第一包数据
//从第二包数据开始之后都可以正常使用
reg [7:0] xor_right_dingwei_valid_cnt; //定位和校验成功个数计数器，最大值为2

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			xor_right_dingwei_valid_cnt <= 1'b0;
		end 
	else if((state == S10) && xor_right && (dingwei_status == 8'h41))	//定位和校验成功
		begin 
			if	(xor_right_dingwei_valid_cnt == 8'd2)	//计数有效数据包
				begin 
					xor_right_dingwei_valid_cnt <= xor_right_dingwei_valid_cnt;
				end 
			else 
				begin 
					xor_right_dingwei_valid_cnt <= xor_right_dingwei_valid_cnt + 1'b1;
				end 
		end 
end 



///////////////////////////////////////获取十进制时间信息

reg [3:0] miao_gewei	;  //秒个位（十进制）
reg [3:0] miao_shiwei	;  //秒十位（十进制）
   
reg [3:0] fen_gewei		;  //分个位（十进制）
reg [3:0] fen_shiwei	;  //分十位（十进制）
    
reg [3:0] shi_gewei		;  //时个位（十进制）
reg [3:0] shi_shiwei	;  //时十位（十进制）

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			miao_gewei	<= 4'd0;
			miao_shiwei	<= 4'd0;
			
			fen_gewei 	<= 4'd0;
			fen_shiwei	<= 4'd0;
			
			shi_gewei	<= 4'd0;
			shi_shiwei	<= 4'd0;
		end 
	else 
		begin ////ASCII转十进制
			miao_gewei 	<= tmp_hms_valid[3:0]	;
			miao_shiwei <= tmp_hms_valid[11:8]	; 	

			fen_gewei 	<= tmp_hms_valid[19:16]	;
			fen_shiwei 	<= tmp_hms_valid[27:24]	;
			
			shi_gewei 	<= tmp_hms_valid[35:32]	;
			shi_shiwei 	<= tmp_hms_valid[43:40]	;
		end 
end 


/////////////////////////////////////////UTC时间转北京时间
/////////////////////////////////////////时需要加8
reg [19:0] miao_gewei_decimal	;  	//秒个位（十进制下个位）
reg [19:0] miao_shiwei_decimal	;  	//秒十位（十进制下十位）

reg [19:0] fen_gewei_decimal	;  	//分十位（十进制下百位）
reg [19:0] fen_shiwei_decimal	;  	//分个位（十进制下千位）

reg [19:0] hour_add8			;	

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if(~sys_rst_n)
		begin 
			miao_gewei_decimal <= 20'd0;
			miao_shiwei_decimal <= 20'd0;
			fen_gewei_decimal <= 20'd0;
			fen_shiwei_decimal <= 20'd0;
			hour_add8 <= 20'd0;
			
			final_time <= 20'd0;
		end 
	else if(xor_right_dingwei_valid_cnt == 8'd2)	//有效接收到的第二包之后的数据
		begin 
		
			//判断小时加8是否超过24时，最终得到准确的时（h）
			hour_add8 <= (((shi_shiwei*10 + shi_gewei) + 8) > 24) ? 
						 (((shi_shiwei*10+shi_gewei)+8-24)*10000):((shi_shiwei*10+ shi_gewei)+8)*10000;
			
			fen_shiwei_decimal <= fen_shiwei * 1000	;//分十位存储在十进制下千位
			fen_gewei_decimal <= fen_gewei * 100	;//分个位存储在十进制下百位
			miao_shiwei_decimal <= miao_shiwei * 10	;//秒十位存储在十进制下十位
			miao_gewei_decimal <= miao_gewei * 1	;//秒个位存储在十进制下个位
			
			final_time <= hour_add8 + fen_shiwei_decimal + fen_gewei_decimal + 		
																miao_shiwei_decimal + miao_gewei_decimal;
		end 

end 


endmodule 