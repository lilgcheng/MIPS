`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:03:42 04/25/2016
// Design Name:   Shift_left
// Module Name:   C:/Verliog_practice/CPU10/Shift_left_tb.v
// Project Name:  CPU10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shift_left
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Shift_left_tb;

	// Inputs
	reg [25:0] in;

	// Outputs
	wire [27:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shift_left uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

