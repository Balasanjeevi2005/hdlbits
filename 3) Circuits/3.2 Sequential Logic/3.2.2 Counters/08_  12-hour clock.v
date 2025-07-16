module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    reg [3:0]s1,s0,m1,m0,h1,h0;
    always@(posedge clk)begin
        if (reset)begin
            {s1,s0} <= 8'h00;
            {m1,m0} <= 8'h00;
            {h1,h0} <= 8'h12;
            pm <= 1'b0;
        end
        else if(ena) begin
        	//if posedge clk clock starts
        	if(clk)begin
                //sec
                //increment last 4bit at each posedge clk
                if (s0 != 4'h9)
                    s0 <= s0 + 4'h1;
                //increment 1st 4bit at every 10th second
                if (s0 == 4'h9 & s1 != 4'h5)begin
                    s0 <= 4'h0;
                    s1 <= s1 + 1'b1;
                end
                
                //reset ss at every 60sec & incremetn a minute
                if (s1 == 4'h5 & s0 == 4'h9)begin
                    {s1,s0} <=8'h0;
                    m0 <= m0 + 4'h1;
                end
                
                //after each 10th minute increment m1 
                if (m0 == 4'h9 & s1 == 4'h5 & s0 == 4'h9 )begin
                    m0 <= 4'h0;
                    m1 <= m1 + 4'h1;
                end
                //increment a hour after 60min
                if (m1 == 4'h5 & m0 == 4'h9 & s1 == 4'h5 & s0 == 4'h9)begin
                    {m1,m0} <='0;
                    h0 <= h0 + 4'h1;
                end
                
                //hour(h0)reach 9 then reset the h0 to 0
                if (h0 == 4'h9 & m1 == 4'h5 & m0 == 4'h9 & s1 == 4'h5 & s0 == 4'h9 )begin
                    h1 <= h1 + 4'h1;
                    h0 <= 4'h0;
                end
                //12 to 1 clk changing
                if(h1 == 4'h1 & h0 == 4'h2 & m1 == 4'h5 & m0 == 4'h9 & s1 == 4'h5 & s0 == 4'h9 )begin
                    {h1,m1,m0,s1,s0} <= '0;
                    h0 <= 4'h1;
                end
                //pm to am , am to pm switching
                if ({h1,h0} == 8'h11 & {m1,m0} == 8'h59 & {s1,s0} == 8'h59)begin
                    if(pm == 0)
                        pm <= 1'b1;
                    else
                        pm <= 1'b0;
                end  
            end //clk end 
        end//main else end
    end //always block end
    assign ss = {s1,s0};
    assign mm = {m1,m0};
    assign hh = {h1,h0};
endmodule
