module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
  parameter A=3'd0,B=3'd1,C=3'd2,D=3'd3; 
    reg [2:0]state,next;
    always @(*) begin
        case(state)
            A: next = r[1]?B:(r[2]?C:(r[3]?D:A));
            B: next = r[1]?B:A;
            C: next = r[2]?C:A;
            D: next = r[3]?D:A;
            default:next=A;
        endcase
    end
    always@(posedge clk)begin
        if(~resetn) state<=A;
        else state <= next;
    end
    assign g={state==D,state==C,state==B};
endmodule
