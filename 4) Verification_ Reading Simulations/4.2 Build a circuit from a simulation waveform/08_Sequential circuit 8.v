module top_module (
    input clock,
    input a,
    output p,
    output q );
    wire temp;
    assign q=temp;
    assign p=clock?a:p;
    always@(negedge clock)
        temp<=a;   
endmodule
