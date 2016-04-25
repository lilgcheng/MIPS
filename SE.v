`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:17 04/13/2016 
// Design Name: 
// Module Name:    SE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SE(
	input [15 : 0] in_16,
	output reg [31 : 0] out_32
    );

	always@(in_16) begin
		if(in_16[15] == 0) begin
			out_32 <= {16'h0000 , in_16};
		end 
		else begin 
			if(in_16[15] == 1) begin
				out_32 <= {16'hffff, in_16};
			end
			else begin 
				out_32 <= in_16;
			end
		end
	end
endmodule
