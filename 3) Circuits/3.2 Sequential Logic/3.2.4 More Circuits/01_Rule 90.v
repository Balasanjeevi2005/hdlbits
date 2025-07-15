module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    always @(posedge clk)begin
        if (load)
            q<=data;
        else 
            q<=q[511:1]^{q[510:0],1'b0};
    end
endmodule
// (or)
// module top_module(
//     input clk,
//     input load,
//     input [511:0] data,
//     output [511:0] q ); 
//     integer i;
//     always @(posedge clk)begin
//         if (load)
//             q<=data;
//         else begin
//             for (i=1;i<511;i++)begin
//                 q[i] <= q[i+1] ^ q[i-1];
//             end
//             q[0]<=q[1];
//             q[511]<=q[510];
//         end
//     end
// endmodule
