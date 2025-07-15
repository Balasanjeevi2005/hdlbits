module top_module ( input clk, input d, output q );
    wire wq1,wq2;
    my_dff d1(clk,d,wq1),
           d2(clk,wq1,wq2),
           d3(clk,wq2,q);
endmodule
