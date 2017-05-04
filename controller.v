module controller (
	input					clk,
	input					reset,
	output reg			timer_en,
	input					timer_done,
	output reg 			pos_en,
	output reg			plot_en
	);
		
	parameter WAIT						= 5'd0;	
	parameter UPDATE					= 5'd1;
	parameter PLOT						= 5'd2;
	
	reg [4:0] state;
	reg [4:0] next_state;
	
	always @(posedge clk) begin
		if (reset)
			state <= WAIT;
		else
			state <= next_state;
	end
			
	always @(*) begin
		timer_en					= 1'b0;
		pos_en					=1'b0;
		plot_en = 1'b0;
		
		case (state)
			WAIT: begin
				timer_en = 1;
				if (timer_done)
					next_state = UPDATE;
				else
					next_state = WAIT;
			end
			
			UPDATE: begin
				pos_en = 1;
				next_state = PLOT;
			end
			
			PLOT: begin
				//Plot the sprite and go back to WAIT
				plot_en = 1;
				next_state = WAIT;
			end
						
			default: next_state = WAIT;
			
		endcase
	end
	
endmodule
