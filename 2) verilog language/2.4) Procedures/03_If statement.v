module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    assign out_assign=( ( sel_b1 & sel_b2 ) == 0 )? a : b;
    always@(*)
begin
    if( (sel_b1 & sel_b2) == 0 )
		out_always <= a;
	else
		out_always <= b;
end
    
endmodule
