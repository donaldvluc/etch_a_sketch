module keycode_decoder (
	input			[7:0]	keycode,
	input					make,
	output				up,
	output				down,
	output				left,
	output				right,
	output				start_game
	);
	
	parameter [7:0] UP_KEY				= 8'h75;
	parameter [7:0] DOWN_KEY 			= 8'h72;
	parameter [7:0] LEFT_KEY 			= 8'h6b;
	parameter [7:0] RIGHT_KEY 			= 8'h74;
	parameter [7:0] START_GAME_KEY	= 8'h1b;
	
	assign up				= (keycode == UP_KEY) && make;
	assign down				= (keycode == DOWN_KEY) && make;
	assign left				= (keycode == LEFT_KEY) && make;
	assign right			= (keycode == RIGHT_KEY) && make;
	assign start_game		= (keycode == START_GAME_KEY) && make;
	
endmodule
