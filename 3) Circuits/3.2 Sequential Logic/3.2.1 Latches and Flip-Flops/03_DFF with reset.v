module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk)begin
        if(reset==1'b1)
            q<=8'h00;
        else
        	q<=d;
    end
endmodule
