module hexdigit (
	input [3:0] num_to_display,
	output reg [6:0] seven_seg_ctrl);

	always @(num_to_display) begin
		seven_seg_ctrl = 7'b1111111;// turns off the display
		
		case (num_to_display)
			4'b0000: seven_seg_ctrl = 7'b1000000; //0
			4'b0001: seven_seg_ctrl = 7'b1111001; //1
			4'b0010: seven_seg_ctrl = 7'b0100100; //2
			4'b0011: seven_seg_ctrl = 7'b0110000; //3
			4'b0100: seven_seg_ctrl = 7'b0011001; //4
			4'b0101: seven_seg_ctrl = 7'b0010010; //5
			4'b0110: seven_seg_ctrl = 7'b0000010; //6
			4'b0111: seven_seg_ctrl = 7'b1111000; //7
			4'b1000: seven_seg_ctrl = 7'b0000000; //8
			4'b1001: seven_seg_ctrl = 7'b0010000; //9
			4'b1010: seven_seg_ctrl = 7'b0001000; //10
			4'b1011: seven_seg_ctrl = 7'b0000011; //11
			4'b1100: seven_seg_ctrl = 7'b1000110; //12
			4'b1101: seven_seg_ctrl = 7'b0100001; //13
			4'b1110: seven_seg_ctrl = 7'b0000110; //14
			4'b1111: seven_seg_ctrl = 7'b0001110; //15
		endcase
	end
endmodule
