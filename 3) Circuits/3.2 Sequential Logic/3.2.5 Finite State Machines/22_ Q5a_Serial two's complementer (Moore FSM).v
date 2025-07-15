module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    parameter s0=0,s1=1,s2=3;
    reg [1:0]state,next;
    always @(*) begin
        case(state)
            s0: next = x?s1:s0;
            s1: next = x?s2:s1;
            s2: next = x?s2:s1;
            default:next=s0;
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= s0;
        else
            state <= next;
    end
    assign z =(state==s1);
endmodule
