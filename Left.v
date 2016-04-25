`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:50 04/14/2016 
// Design Name: 
// Module Name:    Left 
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
module Left(
	input [31 : 0] in_32,
	output reg [31 : 0] out_32
    );
	
	always @(in_32) begin
		out_32 <= in_32<< 2 ;
	end

endmodule
