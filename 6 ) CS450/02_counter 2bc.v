module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    always@(posedge clk,posedge areset)begin
        if (areset)
            state<=2'b01; 
        else if (train_valid==1'b1)begin
            if (state==2'b00)
                state <= train_taken? (state + 1'b1): state;
            else if (state==2'b01 | state==2'b10)
                state <= train_taken? (state + 1'b1):(state - 1'b1);
            else if (state==2'b11)
                state <= train_taken? state:(state - 1'b1);
        end
    end        
endmodule
