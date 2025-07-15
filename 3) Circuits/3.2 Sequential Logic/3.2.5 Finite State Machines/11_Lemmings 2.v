module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
parameter wl=0,wr=1,lg=2,rg=3;
    reg [1:0]state,next;
    always@(*)begin
        case(state)
            wl:next=ground?(bump_left?wr:wl):lg;
            wr:next=ground?(bump_right?wl:wr):rg;
            lg:next=ground?wl:lg;
            rg:next=ground?wr:rg;
        endcase
    end
    always@(posedge clk,posedge areset)begin
        if (areset) state<=wl;
    	else state<=next;
    end
    
    assign walk_left=(state==wl);
    assign walk_right=(state==wr);
    assign aaah=(state==lg | state==rg);
        
endmodule
