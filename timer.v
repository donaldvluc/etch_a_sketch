module timer (
	input 				clk,
	input 				reset,
	input					en,
	input 	[25:0]	limit,
	output				at_limit);

	reg [25:0] count;
	
	assign at_limit = (count == limit);

	always @(posedge clk)
		if (reset || at_limit)
			count <= 0;
		else if (en)
			count <= count + 1'b1;
	
endmodule
