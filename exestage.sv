module EXEstage (clk, EXE_CMD, val1_sel, val2_sel, ST_val_sel, val1, val2, ALU_res_MEM, result_WB, ST_value_in, ALUResult, ST_value_out);
typedef enum {EXE_ADD, EXE_SUB, EXE_AND, EXE_OR, EXE_NOR, EXE_XOR, EXE_SLA, EXE_SLL, EXE_SRA, EXE_SRL, EXE_NO_OPERATION} execmd_t;

input logic clk;
input logic [1:0] val1_sel, val2_sel, ST_val_sel;
input execmd_t EXE_CMD;
input logic [31:0] val1, val2, ALU_res_MEM, result_WB, ST_value_in;
output logic [31:0] ALUResult, ST_value_out;

logic [31:0] ALU_val1, ALU_val2;

mux3 #(.LENGTH('d32)) mux_val1 (.in1(val1),
						.in2(ALU_res_MEM),
						.in3(result_WB),
						.sel(val1_sel),
						.out(ALU_val1));

mux3 #(.LENGTH('d32)) mux_val2 (.in1(val2),
						.in2(ALU_res_MEM),
						.in3(result_WB),
						.sel(val2_sel),
						.out(ALU_val2));

mux3 #(.LENGTH('d32)) mux_ST_value (.in1(ST_value_in),
					.in2(ALU_res_MEM),
					.in3(result_WB),
					.sel(ST_val_sel),
					.out(ST_value_out));

ALU ALU(.val1(ALU_val1),
		.val2(ALU_val2),
		.EXE_CMD(EXE_CMD),
		.aluout(ALUResult));
endmodule : EXEstage
