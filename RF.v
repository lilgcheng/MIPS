`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:01 04/13/2016 
// Design Name: 
// Module Name:    RF 
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
module RF(
   	//read address port
	input [4 : 0] ra1,
	input [4 : 0] ra2,
	//write address port
	input [4 : 0] wa,
	//write data port
	input [31 : 0] wd,
	input clk, RegWrite,
	//read data port
	output  [31 : 0]rd1,
	output  [31 : 0]rd2
    );
	reg [31:0] Registers [0:31];
	//初始化
	integer i = 0;
	initial begin
		for(i = 0; i <= 31; i = i + 1) 
			Registers[i] = 0;
	end
	
	assign rd1 = Registers[ra1];
	assign rd2 = Registers[ra2];
	
	always @(posedge clk) begin
		//寫入資料
		if(RegWrite == 1) begin
			Registers[wa] <= wd;
		end
	end
	
endmodule
