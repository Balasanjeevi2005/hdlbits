module top_module( 
    input [99:0] in,
    output [99:0] out
);
integer i;
    always@(*)begin
        for (i=0;i<100;i=i+1)
            out[i]=in[99-i];
    end
endmodule
// (0r)solution
//  always @(*) begin
// for (int i=0;i<$bits(out);i++)  // $bits() is a system function that returns the width of a signal.
// out[i] = in[$bits(out)-i-1];// $bits(out) is 100 because out is 100 bits wide.
// end
