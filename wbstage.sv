module WBstage (MEM_R_EN, memData, aluRes, WB_res);
input logic MEM_R_EN;
input logic [31:0] memData, aluRes;
output logic [31:0] WB_res;

assign WB_res = (MEM_R_EN) ? memData : aluRes;

endmodule : WBstage
