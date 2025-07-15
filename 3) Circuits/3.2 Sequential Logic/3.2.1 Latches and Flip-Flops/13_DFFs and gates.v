module top_module (
    input clk,
    input x,
    output z
); 
    wire Q0,Q1,Q2;
    D_FF d1(.q(Q0),.d(x^Q0),.clk(clk));
    D_FF d2(.q(Q1),.d(x & ~Q1),.clk(clk));
    D_FF d3(.q(Q2),.d(x | ~Q2),.clk(clk));
    assign z=~(Q0|Q1|Q2);
endmodule
module D_FF(
			output q,
		    input d,clk
			);
    always@(posedge clk)
        q<=d;
endmodule
