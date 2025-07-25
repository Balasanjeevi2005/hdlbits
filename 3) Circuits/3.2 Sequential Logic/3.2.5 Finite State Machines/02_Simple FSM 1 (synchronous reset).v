module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;  
    reg out;

    // Fill in state name declarations
    reg present_state, next_state;
    parameter B = 1'b0,A = 1'b1;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state = B;
            out=1'b1;
        end else begin
            case (present_state)
                // Fill in state transition logic
                A: begin
                    if (in)
                        next_state = A;
                    else
                        next_state = B;
                end
                B:next_state = in?B:A;
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                // Fill in output logic
                A: out = 1'b0;
                B: out = 1'b1;
            endcase
        end
    end

endmodule
