`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:37 04/13/2016 
// Design Name: 
// Module Name:    IR 
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
module IR(
    input [31 : 0] Address,
	output reg[31 : 0] inst
    );

	reg [31:0] mem[0:31];

	//不可使用clk會造成執行兩次
   always @( Address) begin
		//I-type
		case(Address) //   Opcode    Rs       Rt             immediate
			//0 : inst = 32'b000000_00000_00000_00000_00000_000000;
			0 : inst = 32'b101011_00000_00000_00000_00000_001000; //暫存器[0]存8
			4 : inst = 32'b101011_00001_00001_00000_00000_000100; //暫存器[1]存４
			8 : inst = 32'b001000_00000_00010_00000_00000_000010; //addi 暫存器[0]+2存入暫存器[2]
			//           Opcode    Rs       Rt        Rd
			12 : inst = 32'b000000_00000_00001_00011_00000_100000; //[3] = [0]+[1]
			16 : inst = 32'b000000_00000_00001_00100_00000_100010; //[4]= [0] - [1]
			20 : inst = 32'b000010_00000_00000_00000_00000_100000;
			132 : inst = 32'b000011_00000_00000_00000_00000_000000;
			//beq
			//24 : inst = 32'b000100_00000_00000_00000_00000_000010; 
			
			//40 : inst = 32'b101011_00101_00101_00000_00000_000111; //[6]= 7
		
			default : inst = 32'bz;
		endcase
	end
endmodule
