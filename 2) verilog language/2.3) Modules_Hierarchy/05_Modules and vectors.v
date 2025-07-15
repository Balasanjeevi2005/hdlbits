module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] wq1,wq2,wq3;

    my_dff8 d1(.clk(clk),.d(d),.q(wq1)),
            d2(.clk(clk),.d(wq1),.q(wq2)),
            d3(.clk(clk),.d(wq2),.q(wq3));

    assign q=sel[1]? (sel[0]? wq3 : wq2 ): (sel[0]? wq1 : d);
endmodule
