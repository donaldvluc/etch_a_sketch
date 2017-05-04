module datapath(
	input 					clk,
	input 					reset,					// SW[17]
	input 					timer_en,
	input    [25:0]      timer_limit,
	output 					output_timer_done,
	input 					pos_en,
	input 	[ 3:0]		KEY,
	output	[ 7:0]		xpos,
	output 	[ 7:0]		ypos
	);

	wire [7:0] max_x = 8'd160;
	wire [7:0] max_y = 8'd120;
	
	//position counters:
	position position_x (
		.en 		(pos_en),
		.max  	(max_x),
		.clk 		(clk),
		.reset  	(reset),
		.add 		(~KEY[0]),
		.sub 		(~KEY[1]),
		.q			(xpos)
	);

	position position_y (
		.en 		(pos_en),
		.max  	(max_y),
		.clk 	(clk),
		.reset(reset),
		.add 	(~KEY[2]),
		.sub 	(~KEY[3]),
		.q		(ypos)
	);
	
	//timer:
	timer timer1 (
		.clk				(clk),
		.reset			(reset),
		.en				(timer_en),
		.limit			(timer_limit),
		.at_limit		(output_timer_done)
	);

endmodule
