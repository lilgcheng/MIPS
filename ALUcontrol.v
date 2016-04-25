`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:05 04/18/2016 
// Design Name: 
// Module Name:    ALUcontrol 
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
module ALUcontrol(
   //ALUOp port
		input [1 : 0 ] ALUOp,
		//function code port
		input [ 5 : 0 ] FunCode,
		//ALU control port
		output reg [ 3 : 0 ] AC
    );

	 
	 parameter R_type = 2'b10,
					I_type = 2'b00,
					J_type = 2'b01;
	 
	always @( ALUOp, FunCode ) begin
		if ( ALUOp == R_type ) begin
			case (FunCode)
				32 : AC <= 2;		// add
				34 : AC <= 6;		// sub
				36 : AC <= 0;		// and
				37 : AC <= 1;		// or
				39 : AC <= 12;	// nor
				42 : AC <= 7;		// slt
				default: AC <= 15; // should not happen
			endcase
		end
		else begin
			case (ALUOp)
				//lw or sw 
				I_type : AC <= 2;//add
				//beq
				J_type : AC <= 6;//sub
				default: AC <= 15; // should not happen
			endcase
		end
	end

endmodule
