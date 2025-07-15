module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
 /*  parameter A=6'd1,B=6'd2,C=6'd4,D=6'd8,E=6'd16,F=6'd32;
    reg [5:0] next;
    always @(*) begin
        case(y)
            A: next = w? A:B;
            B: next = w? D:C;
            C: next = w? D:E;
            D: next = w? A:F;
            E: next = w? D:E;
            F: next = w? D:C;
            default:next=A;
        endcase
    end
    */
    assign Y2=(y[1] & ~w);//B?
    assign Y4=((y[2] | y[3] | y[5] | y[6]) & w);//D?
endmodule
