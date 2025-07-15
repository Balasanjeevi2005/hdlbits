module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    fa m(.carry_fa(cout[0]),
		.sum_fa(sum[0]),
		.in1(a[0]),
		.in2(b[0]), 
        .in3(cin)
	   );
generate
    for (i=1;i<100;i++)begin:RCA_100b
        fa m(.carry_fa(cout[i]),
					.sum_fa(sum[i]),
					.in1(a[i]),
					.in2(b[i]),
                    .in3(cout[i-1]) 
                   );
        end
    endgenerate
endmodule
module fa(
		output carry_fa,sum_fa,
		input in1,in2,in3
   		);
    assign {carry_fa,sum_fa}=in1+in2+in3;
endmodule
