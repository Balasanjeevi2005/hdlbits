module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter left=0, right=1, left_ground=2, right_ground=3, left_dig=4, right_dig=5,   splat=6;
    reg[2:0]state,next;
    integer count;
    always@(*)begin
            if(ground)begin
                case(state)
                    left:next=dig?(left_dig):(bump_left?right:left);
                    right:next=dig?(right_dig):(bump_right?left:right);
                    left_dig:next=left_dig;
                    right_dig:next=right_dig;
                    left_ground:next=left;
                    right_ground:next=right;
                    splat:next=splat;
                endcase
            end
            else begin
                case(state)
                    left:next=left_ground;
                    right:next=right_ground;
                    left_dig:next=left_ground;
                    right_dig:next=right_ground;
                    left_ground:next=left_ground;
                    right_ground:next=right_ground;
                    splat:next=splat;
                endcase
            end
        end
    always@(posedge clk,posedge areset)begin
            if(areset) begin
                state<=left;
                count<=0;
            end
            else if(ground==0)begin
                count<=count+1;
                state<=next;
            end
            else if (ground)begin
                if (count<21)begin
                    count<=0;
                    state<=next;
                end
                else
                    state<=splat;
            end
        else
            state<=next;
        end
    assign walk_left=(state==left);
    assign walk_right=(state==right);
    assign aaah=(state==left_ground | state==right_ground);
    assign digging=(state==right_dig | state==left_dig);       
endmodule
