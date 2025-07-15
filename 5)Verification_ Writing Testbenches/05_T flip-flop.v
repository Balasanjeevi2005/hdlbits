module top_module ();
    reg clk=0,reset=0,t=0;
    wire q;
    tff i1(.clk(clk),.reset(reset),.t(t),.q(q));
    initial begin
        #5reset=1;
        #5reset=0;
        #5t=1;
    end
        always #5 clk=~clk;
endmodule
