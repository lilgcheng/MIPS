`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:08 04/13/2016 
// Design Name: 
// Module Name:    Add 
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
module Add(
	input [31 : 0] PC_Result,
	output reg[31 : 0] Add_Result
    );
	//pc = pc + 4
	always @(PC_Result) begin
		Add_Result <= PC_Result + 32'h00000004;
	end

endmodule

