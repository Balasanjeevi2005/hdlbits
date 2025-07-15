module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q
);
    always @(posedge clk) begin
        if (L)
            Q <= r_in;
        else
            Q <= q_in;
    end
endmodule

// (or)

// module top_module (
// 	input clk,
// 	input L,
//     input r_in,
// 	input q_in,
// 	output reg Q);
//     wire Q1,Q2,Q0;
//     wire y1,y2,y3;
//     MUX2_1 m1(.y(y1),.a(Q2),.b(r_in),.s(L));
//     D_FF d1(.q(Q0),.d(y1),.clk(clk));
    
//     MUX2_1 m2(.y(y2),.a(Q0),.b(r_in),.s(L));
//     D_FF d2(.q(Q1),.d(y2),.clk(clk));
    
//     MUX2_1 m3(.y(y3),.a(Q1^Q2),.b(r_in),.s(L));
//     D_FF d3(.q(Q2),.d(y3),.clk(clk));
// endmodule
// module MUX2_1(
// 			output y,
// 		    input a,b,s
// 			);
// assign y=s?b:a;
// endmodule 
// module D_FF(
// 			output q,
// 		    input d,clk
// 			);
//     always@(posedge clk)
//         q<=d;
// endmodule
