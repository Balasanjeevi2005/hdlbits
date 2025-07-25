module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [2:0] carry;

    bcd_fadd u0 (.a(a[3:0]),    .b(b[3:0]),    .cin(cin),     .sum(sum[3:0]),    .cout(carry[0]));
    bcd_fadd u1 (.a(a[7:4]),    .b(b[7:4]),    .cin(carry[0]), .sum(sum[7:4]),    .cout(carry[1]));
    bcd_fadd u2 (.a(a[11:8]),   .b(b[11:8]),   .cin(carry[1]), .sum(sum[11:8]),   .cout(carry[2]));
    bcd_fadd u3 (.a(a[15:12]),  .b(b[15:12]),  .cin(carry[2]), .sum(sum[15:12]),  .cout(cout));

endmodule
