import defines::*;
module IFIDpipelinereg (clk, rstn, flush, freeze, pcIn, instructionIn, pcOut, instructionOut);

input logic clk, rstn, flush, freeze;
input logic [WORD_LEN-1:0] pcIn, instructionIn;
output logic [WORD_LEN-1:0] pcOut, instructionOut;

always_ff @(posedge clk)
begin
    if (!rstn)
    begin
    pcOut <= '0;
    instructionOut <= '0;
    end
    else
    begin
        if (!freeze)
	begin
	    if(flush)
	    begin
	    pcOut <= '0;
	    instructionOut <= '0;
	    end
	    else
	    begin
	    pcOut <= pcIn;
	    instructionOut <= instructionIn;
	    end
	end
    end
end

endmodule : IFIDpipelinereg
