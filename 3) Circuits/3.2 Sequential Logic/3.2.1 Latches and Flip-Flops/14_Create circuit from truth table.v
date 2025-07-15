module top_module (
    input clk,
    input j,
    input k,
    output reg Q
);
    wire D;
    assign D = (j & ~Q) | (~k & Q); \\next state eqn
    always @(posedge clk) begin
        Q <= D;
    end
endmodule
