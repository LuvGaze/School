module seg_595_static(
	
		input wire sys_clk,
		input wire sys_rst_n,

		output wire stcp,
		output wire shcp,
		output wire ds,
		output wire oe
		
	);



		wire [5:0] sel; //位选信号
		wire [7:0] seg; //段选信号


	seg_static seg_static(
	
	   .sys_clk(sys_clk),
	   .sys_rst_n(sys_rst_n),
	   
	   .sel(sel), //位选信号
	   .seg(seg)  //段选信号
	   
	);


	hc595_ctrl hc595_ctrl(
	
	   .sys_clk(sys_clk),
	   .sys_rst_n(sys_rst_n),
	   
	   .seg(seg),
	   .sel(sel),
	   
	   .stcp(stcp),
	   .shcp(shcp),
	   .ds(ds),
	   .oe(oe)
	   
	   
	);













	endmodule