// position.v
module position(
	input 				en,
	input		[7:0]		max,
	input 				clk,
	input 				reset,
	input 				add,
	input					sub,
	output reg [7:0]	q
	);
	
	always@(posedge clk) begin
		if(reset) 
			q <= 0;
		else 
			if(en) 
				if(add && ~sub && q<max)
					q<=q+1;
				else if(sub && ~add && q>0) 
					q<=q-1;
		end
	
endmodule
