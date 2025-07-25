module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF i1(.clk(KEY[0]),.w(LEDR[1]),.R(SW[0]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[0]));
    MUXDFF i2(.clk(KEY[0]),.w(LEDR[2]),.R(SW[1]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[1]));
    MUXDFF i3(.clk(KEY[0]),.w(LEDR[3]),.R(SW[2]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[2]));
    MUXDFF i4(.clk(KEY[0]),.w(KEY[3]),.R(SW[3]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[3])); 
endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output  Q
);
    wire temp;
    assign temp=L?R:(E?w:Q);
    always @(posedge clk)
        Q <=temp;
endmodule
// (or)b
// module MUXDFF (
//     input clk,
//     input w, R, E, L,
//     output  Q
// );
//     always @(posedge clk) begin
//         if (L)
//             Q <=R;
//         else begin
//             if (E)
//                 Q<=w;
//             else
//                 Q <= Q;
//         end
//     end
// endmodule
