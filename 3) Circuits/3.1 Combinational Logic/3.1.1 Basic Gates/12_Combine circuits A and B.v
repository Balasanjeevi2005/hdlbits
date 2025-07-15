module top_module (input x, input y, output z);
    assign z=~(x<y);
endmodule
// (or given_ans)
// assign z = x|~y;
