module top_module( 
    input [254:0] in,
    output [7:0] out );
integer i;
    always@(*)begin
        out=1'b0;
        for (i=0;i<255;i++)
        begin
            if (in[i]==1'b1)
                out=out+1;
        end
    end
endmodule
// (or-given)
// 	always @(*) begin	// Combinational always block
// 		out = 0;
// 		for (int i=0;i<255;i++)
// 			out = out + in[i];
// 	end
