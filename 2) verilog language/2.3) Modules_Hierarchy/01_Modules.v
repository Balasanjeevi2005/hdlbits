module top_module ( input a, input b, output out );
    mod_a m1(.out(out),.in1(a),.in2(b));
endmodule

// don’t use: module top_module ( input a, input b, output out );
//     mod_a m1(.out(out),.a(in1),.b(in2));
// endmodule
