module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 
    always@(posedge clk) begin
        if(load)
            q<=data;
        else begin //CR'+RC'+RL')
            q<=(q[511:0] & ~{q[510:0],1'b0}) //CR'
            |({q[510:0],1'b0} & ~q[511:0]) //RC'
            |({q[510:0],1'b0} & ~q[511:1]); //RL'
        end
    end    
endmodule
