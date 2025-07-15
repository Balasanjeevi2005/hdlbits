module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter s0=0,s1=1,s2=2;
    reg[1:0]state,next;
    always@(*)begin
        case(state)
            s0:next=x?s1:s0;//1
            s1:next=x?s1:s2;//0
            s2:next=x?s1:s0;//1
        endcase
    end    
    always@(posedge clk,negedge aresetn)begin
        if(aresetn==0)
            state<=s0;
        else 
            state<=next;
    end
    assign z=(state==s2 & next==s1);          
endmodule
