module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //
    parameter  A=0, B=1, C=2, D=3; // A=2'd0, B=2'd1, C=2'd2, D=2'd3--error

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = ~in & (state[A] | state[C]);
    assign next_state[B] = in & (state[A] | state[B] | state[D]);
    assign next_state[C] = ~in & (state[B] | state[D]);
    assign next_state[D] = in & state[C];
    // Output logic: 
    assign out =(state==D);
endmodule