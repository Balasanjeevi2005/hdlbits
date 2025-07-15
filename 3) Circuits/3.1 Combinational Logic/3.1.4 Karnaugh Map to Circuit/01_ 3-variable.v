module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (a&c&d)|(c&d&b)|(~c & ~b)|(~d & ~a);
endmodule
