module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    always@(posedge clk)begin
        if (reset)
            q<=32’d1;
        else begin
            q<=q;
            q[31]<=1'b0^q[0];
            q[21]<=q[22]^q[0];
            q[1]<=q[2]^q[0];
            q[0]<=q[1]^q[0];
            q[30:22]<=q[31:23];
            q[20:2]<=q[21:3];
        end
    end         
endmodule
