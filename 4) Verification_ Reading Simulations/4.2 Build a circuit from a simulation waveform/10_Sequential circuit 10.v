module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    assign q =state^a^b;
    always@(posedge clk)begin
        if(a & b & ~state)
            state<=1'b1;
        if (~a & ~b & state)
            state<=1'b0;
    end
endmodule
