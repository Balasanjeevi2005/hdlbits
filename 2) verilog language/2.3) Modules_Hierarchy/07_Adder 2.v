module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2;
    add16 m1(.a(a[15:0]),
             .b(b[15:0]),
             .sum(sum[15:0]),
             .cin(1'b0),
             .cout(cout1)),
          m2(.a(a[31:16]),
   	         .b(b[31:16]),
             .sum(sum[31:16]),
             .cin(cout1),
             .cout(cout2));
                                             
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign {cout,sum}=a+b+cin;

endmodule
