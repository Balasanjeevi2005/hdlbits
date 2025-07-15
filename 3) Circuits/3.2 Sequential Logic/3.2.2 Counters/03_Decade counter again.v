module top_module (
    input clk,
    input reset,
    output [3:0] q);
    reg prev_rest;
    always @(posedge clk)begin
        if (~prev_rest & reset)
            q<=4'h1;
        else if( q == 4'ha)
            q<=4'h1;
        else begin
            q<=q+1'b1;
            prev_rest<='0;
        end
    end
endmodule
