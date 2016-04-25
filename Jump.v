`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:04 04/25/2016 
// Design Name: 
// Module Name:    Jump 
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
module Jump(
	input [27 : 0] in1,
	input [3 : 0] in2,
	output [31 : 0] out
     );

	assign out = {in2 , in1};
endmodule
