module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    reg pre_reset,pre_slowena;
    always@(posedge clk)begin
        if((~pre_reset & reset))
            q<='0;
        else if (~pre_slowena & slowena)begin
            if(q==4'h9)
                q<='0;
            else
                q<=q+1'b1;
        end
        else begin
            pre_reset<=reset;
            pre_slowena=slowena;
        end
    end     
endmodule
