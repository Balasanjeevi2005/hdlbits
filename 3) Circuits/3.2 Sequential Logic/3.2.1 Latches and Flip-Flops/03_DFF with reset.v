module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk,posedge areset)begin
        if(areset==1'b1)
            q<='d0;
        else
            q<=d;
    end
endmodule
// q<='0;
