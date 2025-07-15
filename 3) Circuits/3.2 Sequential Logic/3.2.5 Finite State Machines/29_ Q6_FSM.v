module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
  parameter A=6'd1,B=6'd2,C=6'd4,D=6'd8,E=6'd16,F=6'd32;//we can give any value 
    reg [5:0]state,next;
    always @(*) begin
        case(state)
            A: next = w? A:B;
            B: next = w? D:C;
            C: next = w? D:E;
            D: next = w? A:F;
            E: next = w? D:E;
            F: next = w? D:C;
            default:next=A;
        endcase
    end
    always@(posedge clk)begin
        if(reset) state<=A;
        else state<=next;
    end
    assign z=(state==E | state==F);
endmodule
