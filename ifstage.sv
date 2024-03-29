import defines::*;
module IFstage (clk, rstn, brTaken, brOffset, freeze, PC, instruction);
input logic clk, rstn, brTaken, freeze;
input [WORD_LEN-1:0] brOffset;
output [WORD_LEN-1:0] PC, instruction;

logic [WORD_LEN-1:0] adderIn1, adderOut, brOffsetTimes4;

mux #(.LEN(WORD_LEN)) adderInput (.in1(32'd4),
				.in2(brOffsetTimes4),
				.sel(brTaken),
				.out(adderIn1));

adder add4 (.in1(adderIn1),
		.in2(PC),
		.out(adderOut));

register PCReg (.clk(clk),
		.rstn(rstn),
		.writeEn(~freeze),
		.regIn(adderOut),
		.regOut(PC));

InstructionMem instructions (.rstn(rstn),
			.addr(PC),
			.instruction(instruction));

assign brOffsetTimes4 = brOffset << 2;

endmodule : IFstage
