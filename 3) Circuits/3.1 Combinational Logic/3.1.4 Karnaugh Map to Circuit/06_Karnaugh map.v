module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign mux_in={c&d,~d,1'b0,c|d};

endmodule
// (or-using mux)
//     assign mux_in[3]=c?d:0,
//         mux_in[2]=d?0:1,
//         mux_in[1]=1'b0,
//         mux_in[0]=c?1:d;
