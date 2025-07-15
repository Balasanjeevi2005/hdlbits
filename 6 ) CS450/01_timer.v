module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    wire [9:0]counter;
    assign tc=!counter;
    always@(posedge clk)begin
        if(load)
            counter<=data;
        else if(counter!=0)
            counter<=counter-1'b1;
    end       
endmodule
