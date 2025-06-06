module top_level(
    input wire sys_clk,    // 50MHz时钟
    input wire sys_rst_n,  // 复位信号（低有效）
    input wire rx,         // 串口接收（GPS信号输入）
    output wire stcp,      // HC595 stcp
    output wire shcp,      // HC595 shcp
    output wire ds,        // HC595 数据输入
    output wire oe         // HC595 使能
);

// 内部信号声明
wire [7:0] po_data;
wire po_flag;
wire [19:0] final_time;
wire [5:0] point = 6'b000000; // 无小数点
wire seg_en = 1'b1;           // 使能数码管
wire sign = 1'b0;             // 无符号

// 实例化串口接收模块
uart_rx
#(
     .UART_BPS(9600), // 串口波特率
    . CLK_FREQ (50_000_000) // 时钟频率
)
uart_rx_inst(
    .sys_clk			(sys_clk			),
	 .sys_rst_n		(sys_rst_n		),
	 .rx					(rx					),
	 .po_data	(po_data	),
	 .po_flag			(po_flag			)
	  
	 
);

// 实例化GPRMC解码模块
GPRMC_decode GPRMC_decode_inst(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .po_data(po_data),
    .po_flag(po_flag),
    .final_time(final_time)
);

// 实例化数码管显示顶层模块（seg_595_dynamic）
seg_595_dynamic seg_595_dynamic_inst(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .data(final_time),
    .point(point),
    .seg_en(seg_en),
    .sign(sign),
    .stcp(stcp),
    .shcp(shcp),
    .ds(ds),
    .oe(oe)
);

endmodule