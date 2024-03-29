import defines::*;
module ForwardingUnit (src1_EXE, src2_EXE, ST_src_EXE, dest_MEM, dest_WB, WB_EN_MEM, WB_EN_WB, val1_sel, val2_sel, ST_val_sel);

input logic [REG_FILE_ADDR_LEN-1:0] src1_EXE, src2_EXE, ST_src_EXE;
input logic [REG_FILE_ADDR_LEN-1:0] dest_MEM, dest_WB;
input logic WB_EN_MEM, WB_EN_WB;
output logic [FORWARD_SEL_LEN-1:0] val1_sel, val2_sel, ST_val_sel;

always_comb
begin
//initializing sel signals to 0
{val1_sel, val2_sel, ST_val_sel} = '0;

//Generating forwarding control signals for store value
if (WB_EN_MEM && (ST_src_EXE == dest_MEM))
ST_val_sel = 2'b01;
else if (WB_EN_WB && (ST_src_EXE == dest_WB))
ST_val_sel = 2'b10;

//Generating forwarding control signals for ALU val1
if (WB_EN_MEM && (src1_EXE == dest_MEM))
val1_sel = 2'b01;
else if (WB_EN_WB && (src1_EXE == dest_WB))
val1_sel = 2'b10;

//Generating forwarding control signals for ALU val2
if (WB_EN_MEM && (src2_EXE == dest_MEM))
val2_sel = 2'b01;
else if ((WB_EN_WB) && (src2_EXE == dest_WB))
val2_sel = 2'b10;

end

endmodule : ForwardingUnit
