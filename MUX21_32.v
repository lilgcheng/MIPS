`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:57:37 04/13/2016 
// Design Name: 
// Module Name:    MUX21_32 
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
module MUX21_32(
   input [31 : 0] A, B,
	input SEL,
	output [31: 0] MUX_OUT
    );

	assign MUX_OUT = (SEL==1) ? B : A; 

endmodule
