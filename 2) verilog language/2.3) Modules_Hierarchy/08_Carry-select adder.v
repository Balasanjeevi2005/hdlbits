module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2,cout3;
    wire [15:0]s1,s2;
    add16 a1(.a(a[15:0]),
             .b(b[15:0]),
             .sum(sum[15:0]),
             .cin(1'b0),
             .cout(cout1)),
          a2(.a(a[31:16]),
   	         .b(b[31:16]),
             .sum(s1),
             .cin(1'b0),
             .cout(cout2)),
          a3(.a(a[31:16]),
   	         .b(b[31:16]),
             .sum(s2),
             .cin(1'b1),
             .cout(cout3));
    assign sum[31:16]=cout1?s2:s1;                                        
endmodule
