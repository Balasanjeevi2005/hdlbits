module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [100:0]c;
    assign c[0]=cin;
generate 
genvar i;
    for (i=0;i<100;i=i+1)begin:BCD
		begin 
            bcd_fadd m(.a(a[i*4 +: 4]),
                       .b(b[i*4 +: 4]),
                       .cin(c[i]),
                       .sum(sum[i*4 +: 4]),
                       .cout(c[i+1]) 
				  );
		end
    end
    endgenerate
    assign cout=c[100];
endmodule
