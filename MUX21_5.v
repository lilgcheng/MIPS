`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:51 04/13/2016 
// Design Name: 
// Module Name:    MUX21_5 
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
module MUX21_5(
	input [4 : 0] A, B,
	input RegDst,
	output [4 : 0] MUX_OUT
    );

	assign MUX_OUT = (RegDst==1) ? B : A; 

endmodule
