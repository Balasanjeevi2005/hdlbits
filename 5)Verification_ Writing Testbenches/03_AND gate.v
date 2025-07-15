module top_module();
    wire out;
    reg [1:0]in;
    initial begin
        in=0;
        #10in[0]=1;
        #10in[1]=1;in[0]=0;
        #10in='1;
    end 
    andgate i1(.in(in),.out(out)); //before or after-- ok
endmodule
