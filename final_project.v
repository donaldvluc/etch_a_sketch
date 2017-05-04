module final_project (
	input [3:0] KEY,  // KEY[1] : resetn | KEY[0] : plot
	input CLOCK_50,
	input [17:0] SW,
	output [9:0] VGA_R,
	output [9:0] VGA_G,
	output [9:0] VGA_B,
	output VGA_HS,
	output VGA_VS,
	output VGA_BLANK,
	output VGA_SYNC,
	output VGA_CLK,
	output [6:0] HEX0,
	output [6:0] HEX7,
	output [6:0] HEX6,
	output [6:0] HEX5,
	output [6:0] HEX4,
	output LEDR,
	output LEDG );
	
	wire [7:0] vga_x;
	wire [7:0] vga_y;
	wire plot_en;
	
	assign LEDR = SW;
	//assign [3:0] LEDG = KEY;
	
	processor processor1(
	.clk			(CLOCK_50),
	.reset		(SW[17]),
	.plot_en		(plot_en),	
	.KEY			(KEY),
	.vga_x		(vga_x),
	.vga_y		(vga_y)
	);	

	vga_adapter vga_a(
		.resetn (~SW[17]),
		.clock (CLOCK_50),
		.colour (SW[2:0]),
		.x (vga_x),
		.y (vga_y[6:0]),
		.plot (plot_en),
		
		.VGA_R (VGA_R),
		.VGA_G (VGA_G),
		.VGA_B (VGA_B),
		.VGA_HS (VGA_HS),
		.VGA_VS (VGA_VS),
		.VGA_BLANK (VGA_BLANK),
		.VGA_SYNC (VGA_SYNC),
		.VGA_CLK (VGA_CLK) 
	);
	
	hexdigit hex0 (
		.num_to_display (SW [2:0]),
		.seven_seg_ctrl (HEX0)
	);
		hexdigit hex7 (
		.num_to_display (SW [17:14]),
		.seven_seg_ctrl (HEX7)
	);
		hexdigit hex6 (
		.num_to_display (SW [13:10]),
		.seven_seg_ctrl (HEX6)
	);
		hexdigit hex5 (
		.num_to_display (SW [9:6]),
		.seven_seg_ctrl (HEX5)
	);
		hexdigit hex4 (
		.num_to_display (SW [5:3]),
		.seven_seg_ctrl (HEX4)
	);
		
endmodule
