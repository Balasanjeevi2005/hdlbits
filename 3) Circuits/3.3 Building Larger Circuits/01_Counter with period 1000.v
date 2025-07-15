module top_module (
    input clk,
    input reset,
    output [9:0] q);
    reg [9:0]count; //insted of integer to truncated avoid warning
    always@(posedge clk)begin
        if (reset | count==999)
            count<=1'b0;
        else
        	count<=count+1'b1;
    end
    assign q=count;
endmodule
