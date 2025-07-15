module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
/*parameter A=6'd1,B=6'd2,C=6'd4,D=6'd8,E=6'd16,F=6'd32;
    reg [5:0]state,next;
    always @(*) begin
        case(y)
            A: next = w? B:A;
            B: next = w? C:D;
            C: next = w? E:D;
            D: next = w? F:A;
            E: next = w? E:D;
            F: next = w? C:D;
            default:next=A;
        endcase
    end */
    assign Y1=(y[0] & w);//B
    assign Y3=((y[5] | y[4] | y[1] | y[2]) & ~w);//D
endmodule
