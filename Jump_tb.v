`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:08:05 04/25/2016
// Design Name:   Jump
// Module Name:   C:/Verliog_practice/CPU10/Jump_tb.v
// Project Name:  CPU10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Jump
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Jump_tb;

	// Inputs
	reg [27:0] in1;
	reg [3:0] in2;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Jump uut (
		.in1(in1), 
		.in2(in2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

