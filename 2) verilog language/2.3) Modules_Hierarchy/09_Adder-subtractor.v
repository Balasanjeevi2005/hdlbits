module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1,cout2;
    wire [31:0]wb;
    add16 a1(.a(a[15:0]),
             .b(wb[15:0]),
             .sum(sum[15:0]),
             .cin(sub),
             .cout(cout1)),
          a2(.a(a[31:16]),
             .b(wb[31:16]),
             .sum(sum[31:16]),
             .cin(cout1),
             .cout(cout2)); 
    assign wb=b^{32{sub}};
endmodule
