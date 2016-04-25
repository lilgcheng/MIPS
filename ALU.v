`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:01 04/13/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
		//ALU control
		input [3 : 0] ALUctrl,
		//data input port
		input [31 : 0] rs,
		input [31 : 0] rt,
		//ALU data output port
		output reg [31 : 0] ALUOut,
		//ALU zero port
		output reg Zero
    );
	
			always @(ALUctrl, rs, rt) begin //reevaluate if these change
				case (ALUctrl)
					0: ALUOut <= rs & rt;//and
					1: ALUOut <= rs | rt;//or
					2: ALUOut <= rs + rt;//add
					6: ALUOut <= rs + (~rt + 1);//subtract
					12: ALUOut <= ~(rs | rt); // result is nor
					default: ALUOut <= 0;
				endcase
			end
			
			always @(ALUOut) begin
				if (ALUOut == 0) begin
					Zero <= 1;
				end else begin
					Zero <= 0;
				end
			
			end
endmodule
