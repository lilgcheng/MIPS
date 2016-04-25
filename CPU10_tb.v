`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:03:36 04/25/2016
// Design Name:   CPU10
// Module Name:   C:/Verliog_practice/CPU10/CPU10_tb.v
// Project Name:  CPU10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU10_tb;

	// Inputs
	reg Reset;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	CPU10 uut (
		.Reset(Reset), 
		.clk(clk)
	);

	
		initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 1;
		
		#100
		Reset = 0;
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
	always #10 clk = ~clk;
      
endmodule

