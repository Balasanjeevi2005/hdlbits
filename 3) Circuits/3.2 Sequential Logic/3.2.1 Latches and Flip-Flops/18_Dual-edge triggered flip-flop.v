module top_module (
    input clk,
    input d,
    output reg q
);

    reg q_pos, q_neg;
	assign q = clk?q_pos : q_neg;
    always @(posedge clk)
        q_pos <= d;
    always @(negedge clk)
        q_neg <= d;
endmodule
