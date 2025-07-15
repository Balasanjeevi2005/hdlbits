module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
    reg [2:0]state,next;
    always @(*) begin
        case(state)
            s0: next = x? s1 : s0;
            s1: next = x? s4 : s1;
            s2: next = x? s1 : s2;
            s3: next = x? s2 : s1;
            s4: next = x? s4 : s3;
            default:next=s0;
        endcase
    end
    always @(posedge clk) begin
        if (reset)
            state <= s0;
        else
            state <= next;   
    end
    assign z=(state==s3 | state==s4);
endmodule
