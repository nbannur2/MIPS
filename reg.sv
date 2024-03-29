import defines::*;

//PC
module register (clk, rstn, writeEn, regIn, regOut);

input logic clk, rstn, writeEn;
input logic [WORD_LEN-1:0] regIn;
output logic [WORD_LEN-1:0] regOut;

always_ff @(posedge clk)
begin
if (!rstn)
regOut <= '0;
else if (writeEn)
regOut <= regIn;
end

endmodule : register
