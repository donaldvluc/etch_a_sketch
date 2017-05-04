module processor (
	input					clk,
	input					reset,	
	output				plot_en,
	input 	[3:0]    KEY,
	output	[7:0]		vga_x,
	output	[7:0]		vga_y
	);
	
	wire	[25:0] 	timer_limit = 26'd5_000_000; 
	//for test bench: 26'd4;
	wire timer_en;
	wire timer_done;
	wire pos_en;
	

	
	datapath datapath1 (
		.clk						(clk),
		.reset					(reset),
		.timer_en				(timer_en),
		.timer_limit			(timer_limit),
		.output_timer_done	(timer_done),
		.pos_en					(en),
		.KEY						(KEY),
		.xpos						(vga_x),
		.ypos 					(vga_y)
	);
	
	controller controller1 (
		.clk						(clk),
		.reset					(reset),
		.timer_en				(timer_en),
		.pos_en					(en),
		.timer_done				(timer_done),	
		.plot_en						(plot_en)
	
	);
	
endmodule