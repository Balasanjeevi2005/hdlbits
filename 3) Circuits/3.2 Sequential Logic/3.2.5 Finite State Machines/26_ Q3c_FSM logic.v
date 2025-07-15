module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
    reg [2:0] next;
    always @(*) begin
        case(y)
            s0: next = x? s1 : s0;
            s1: next = x? s4 : s1;
            s2: next = x? s1 : s2;
            s3: next = x? s2 : s1;
            s4: next = x? s4 : s3;
            default:next=s0;
        endcase
    end
    assign z=(y==s3 | y==s4);
    assign Y0=(next==s3 | next==s1);
endmodule
