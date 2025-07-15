module top_module(
    input clk,
    input [7:0] in,
    input reset,            // Synchronous reset
    output done         // 'done' must be declared as reg
);
    integer ocount, zcount;  // Only need 2 bits to count up to 3
    always @(posedge clk) begin
        if (reset) begin
            ocount <= 0;
            zcount <= 0;
            done <= 0;
        end
        else begin
            done <= 0;  // Default: not done unless condition met

            // Detect start of message: first byte with in[3] == 1
            if (ocount + zcount == 0) begin
                if (in[3])
                    ocount <= 1;
            end
            else if (ocount + zcount < 3) begin
                if (in[3])
                    ocount <= ocount + 1;
                else
                    zcount <= zcount + 1;
            end
            // Once 3 bytes are received, assert done and reset counters
            if (ocount + zcount == 2) begin
                // This is the 3rd byte
                done <= 1;
                ocount <= 0;
                zcount <= 0;
            end
        end
    end
endmodule
