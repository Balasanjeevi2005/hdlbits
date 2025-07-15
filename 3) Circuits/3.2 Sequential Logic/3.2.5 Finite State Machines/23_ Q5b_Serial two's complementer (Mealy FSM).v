module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    parameter s0=1'b0,s1=1'b1;
    reg state,next;
    always @(*) begin
        case(state)
            s0: next = x?s1:s0;
            s1: next = s1;
            default:next=s0;
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= s0;
        else
            state <= next;
    end
    assign z =(state==s0 & next==s1)|(state==s1 & ~x);
endmodule
