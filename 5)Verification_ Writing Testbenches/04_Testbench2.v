module top_module();
    reg clk=0;
    reg in=0;
    reg [2:0]s;
    wire out;
    always #5 clk=~clk;
    initial begin
        s=3'o2;
        #10 s=3'o6;
        #10 s=3'o2;in=1;
        #10 s=3'o7;in=0;
        #10 s=3'o0;in=1;
        #30 in=0;
    end
      
    q7 i1(.clk(clk),.in(in),.s(s),.out(out));
endmodule
