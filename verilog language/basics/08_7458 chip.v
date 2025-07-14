module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire w1,w2,w3,w4;
    assign {w1,w2,w3,w4}={(p2a&p2b),(p1a&p1b&p1c),(p2c&p2d),(p1d&p1e&p1f)};
    assign {p1y,p2y}={(w2|w4),(w1|w3)};

endmodule
