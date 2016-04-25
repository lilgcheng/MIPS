`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:47:35 04/18/2016 
// Design Name: 
// Module Name:    CU 
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
module CU(
	input [5: 0] Opcode,
	output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump,
	output reg [1:0]  ALUOp
    );	

always @(Opcode) begin
	case(Opcode)
		
		//R-type
		6'b000000:
			begin
				 RegDst = 1;
				 ALUSrc = 0;
				 MemtoReg = 0;
				 RegWrite = 1;
				 MemRead = 0;
				 MemWrite = 1;
				 Branch = 0;
				 ALUOp = 2'b10;
				 Jump = 0;
			end
		
		//sw	¦s¤J¦r²Õ
		6'b101011://43
			begin
				RegDst = 0;
				ALUSrc = 1;
				MemtoReg = 0; 
				RegWrite = 1;
				MemRead = 0; 
				MemWrite = 0;
				Branch = 0;
				ALUOp = 2'b00;
				Jump = 0;
			end
			
			//ADDI
			6'b001000://8
			begin
				RegDst = 0;
				ALUSrc = 1;
				MemtoReg = 0; 
				RegWrite = 1;
				MemRead = 0; 
				MemWrite = 0;
				Branch = 0;
				ALUOp = 2'b00;
				Jump = 0;
			end
			
		//beq	
		6'b000100://4
			begin
				RegDst = 0;
				ALUSrc = 0;
				MemtoReg = 0; 
				RegWrite = 1;
				MemRead = 0; 
				MemWrite = 0;
				Branch = 1;
				ALUOp = 2'b01;
				Jump = 0;
			end
			//beq	
		
			6'b000010://jump
			begin
				RegDst = 0;
				ALUSrc = 0;
				MemtoReg = 0; 
				RegWrite = 0;
				MemRead = 0; 
				MemWrite = 0;
				Branch = 1;
				ALUOp = 2'b01;
				Jump = 1;
			end
			
			6'b000011://jump_link
			begin
				RegDst = 0;
				ALUSrc = 0;
				MemtoReg = 0; 
				RegWrite = 0;
				MemRead = 0; 
				MemWrite = 0;
				Branch = 1;
				ALUOp = 2'b01;
				Jump = 1;
			end
		default:
			begin
				RegDst = 0;
				ALUSrc = 0;
				MemtoReg = 0; 
				RegWrite = 0;
				MemRead = 0; 
				MemWrite = 0;
				Branch = 0;
				ALUOp = 2'b10;
				Jump = 0;
			end
		endcase
	end
endmodule
