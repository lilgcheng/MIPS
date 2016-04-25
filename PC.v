`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:12 04/13/2016 
// Design Name: 
// Module Name:    PC 
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
module PC(
	input [31 : 0]PC_Next,
	input Reset, clk,
	output reg [31 : 0] PC_Result
    );
	//ªì©l¤Æ
	initial begin
		PC_Result <= 32'h00000000;
	end
	
	always @(posedge clk or posedge Reset) begin
		if(Reset ==1 )
			PC_Result <= 32'h00000000;
		else
			PC_Result <= PC_Next;
	end
endmodule
