`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:01 04/25/2016 
// Design Name: 
// Module Name:    CPU10 
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
module CPU10(
	input Reset, clk
    );
	//pc 
	wire [31 : 0] PC_Result, PCI;
	
	//Add
	wire [31 : 0] Add_Result;
	
	//IR 
	wire [31 : 0] inst;
	
	//Shift left
	wire [25 : 0] inst25_0;
	wire [27 : 0] SL;
	assign inst25_0 = inst[25 : 0];
	
	//CU
	wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	wire [1 : 0] ALUOp;
	wire [5 : 0] inst31_26;
	assign inst31_26 = inst[31 : 26];

	//RF
	wire [31 : 0] rd_A,rd_B, RM, wd;
	wire [4 : 0] inst25_21;
	wire [4 : 0] inst20_16;
	wire [4 : 0] inst15_11;
	assign inst25_21 = inst[25 : 21];
	assign inst20_16 = inst[20 : 16];
	assign inst15_11 = inst[15 : 11];
	
	//SE
	wire [15 : 0] inst15_0;
	wire [31 : 0] SEOUT;
	assign inst15_0 = inst[15 : 0];
	
	//ALU control
	wire [5 : 0] inst5_0;
	wire [3 : 0] ALUCtrl;
	assign inst5_0 = inst [5 : 0];
	
	//ALU
	wire Zero;
	wire [31 : 0] ALU_Result;
	
	//AND
	wire beq_wire; 
	
	//Jump
	wire [3 : 0] PC_4;
	wire [31 : 0] SJ;
	assign PC_4 = Add_Result[31 : 28];
	
	//other
	wire [4 : 0] wa;
	wire [31 : 0] SA;
	wire [31 : 0] Adder_Result;
	wire [31 : 0] RB;
	wire [31 : 0] MM;
	
	PC U1(
		.PC_Next(PCI),
		.PC_Result(PC_Result),
		.clk(clk)
	);
	
	Add U2(
		.PC_Result(PC_Result),
		.Add_Result(Add_Result)
	);
	
	IR U3(
		.Address(PC_Result),
		.inst(inst)
	);
	
	Shift_left U4(
		.in(inst25_0),
		.out(SL)
	);
	
	CU U5(
		.Opcode(inst31_26),
		.RegDst(RegDst),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite),
		.Jump(Jump),
		.ALUOp(ALUOp)
	);
	
	MUX21_5 U6(
		.A(inst20_16),
		.B(inst15_11),
		.RegDst(RegDst),
		.MUX_OUT(wa)
	);
	
	RF U7(
		.ra1(inst25_21),
		.ra2(inst20_16),
		.wa(wa),
		.wd(wd),
		.rd1(rd_A),
		.rd2(RM),
		.RegWrite(RegWrite),
		.clk(clk)
	);
	
	SE U8(
		.in_16(inst15_0),
		.out_32(SEOUT)
	);
	
	Left U9(
		.in_32(SEOUT),
		.out_32(SA)
	);
	
	MUX21_32 U10(
		.A(RM),
		.B(SEOUT),
		.MUX_OUT(rd_B),
		.SEL(ALUSrc)
	);
	
	ALUcontrol U11(
		.ALUOp(ALUOp),
		.FunCode(inst5_0),
		.AC(ALUCtrl)
	);
	
	Adder U12(
		.A(Add_Result),
		.B(SA),
		.Adder_out(Adder_Result)
	);
	
	ALU U13(
		.rs(rd_A),
		.rt(rd_B),
		.Zero(Zero),
		.ALUOut(ALU_Result),
		.ALUctrl(ALUCtrl)
	);
	
	Mem U14(
		.Address(ALU_Result),
		.Write_Data(RM),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.Read_Data(RB),
		.clk(clk)
	);
	
	AND U15(
		.A(Branch),
		.B(Zero),
		.AND_OUT(beq_wire)
	);
	
	MUX21_32 U16(
		.A(Add_Result),
		.B(Adder_Result),
		.SEL(beq_wire),
		.MUX_OUT(MM)
	);
	
	MUX21_32 U17(
		.A(MM),
		.B(SJ),
		.SEL(Jump),
		.MUX_OUT(PCI)
	);
	
	MUX21_32 U18(
		.A(ALU_Result),
		.B(RB),
		.SEL(MemtoReg),
		.MUX_OUT(wd)
	);
	
	Jump U19(
		.in1(SL),
		.in2(PC_4),
		.out(SJ)
	);
endmodule
