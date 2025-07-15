module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    reg [7:0]temp1,temp2;
    // FSM from fsm_ps2
    
    integer ocount, zcount;  // Only need 2 bits to count up to 3
    always @(posedge clk) begin
        if (reset) begin
            ocount <= 0;
            zcount <= 0;
            done <= 0;
            out_bytes <= 0;
        end
        else begin
            done <= 0;  // Default: not done unless condition met
            // Detect start of message: first byte with in[3] == 1
            if (ocount + zcount == 0) begin
                if (in[3])begin
                    ocount <= 1;
                    temp1<= in;
                end
            end
            else if (ocount + zcount < 3) begin
                if (in[3])begin
                    ocount <= ocount + 1;
                    temp2 <= in;
                end
                else begin
                    zcount <= zcount + 1;
                    temp2 <= in;
                end
            end
            // Once 3 bytes are received, assert done and reset counters
            if (ocount + zcount == 2) begin
                // This is the 3rd byte
                done <= 1;
                ocount <= 0;
                zcount <= 0;
                out_bytes <= {temp1,temp2,in};
            end
        end
    end
    // New: Datapath to store incoming bytes.
endmodule
