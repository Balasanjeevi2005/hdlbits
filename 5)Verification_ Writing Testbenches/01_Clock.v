module top_module ( );
    reg clk=0;
always
    begin
       #5 clk=~clk;
    end
        dut i1(.clk(clk));
endmodule
