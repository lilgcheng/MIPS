`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:35 04/13/2016 
// Design Name: 
// Module Name:    Mem 
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
module Mem(
	input [31 : 0] Address,
	input [31 : 0] Write_Data,
	input clk,
	input MemWrite, MemRead,
	output reg [31 : 0] Read_Data
    );
	reg 	[31:0] mem[0:31];	// stack pointer initialization depends on this
	
	integer i = 0;
		initial begin
			for(i = 0; i <= 31; i = i + 1) 
				mem[i] = 0;
		end
		
	always @ (posedge clk) 
		begin : MEM_WRITE
		   if ( MemWrite == 1 ) begin
			   mem[Address] = Write_Data;
		   end
		end

		// Memory Read Block 
		// Read Operation : When we = 0, oe = 1, cs = 1
	always @ (posedge clk)
		begin : MEM_READ
			if (MemRead ==1) begin
				 Read_Data = mem[Address];
			end
		end
endmodule
