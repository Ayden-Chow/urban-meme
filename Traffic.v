 module traffic(rst,out,carew,clk);
    output reg out[5:0];
    input carew,clk;
    reg nextstate [2:0];
    wire currstate [2:0];
    input rst;
    wire nextstatereset[2:0];
    

    `define GNS 3'b000
    `define YNS 3'b001
    `define RBW0 3'b010
    `define GEW 3'b011
    `define YEW 3'b100
    `define RBW1 3'b101
    `define TRUE 1
    `define FALSE 0

    vDFF #(3)fsmgang(clk,nextstatereset,currstate);
    assign nextstatereset=rst? `GNS : nextstate;
    always @(*) begin
        case({carew,currstate})
            {`TRUE,`GNS}: {out,nextstate}={6'b100_001,`YNS};
            {`FALSE,`GNS}: {out,nextstate}={6'b100_001,`GNS};
            {`TRUE,`YNS},{`FALSE,`YNS}: {out,nextstate}={6'b010_001,`RBW0};
            {`TRUE,`RBW0},{`FALSE,`RBW0}: {out,nextstate}={6'b001_001,`GEW};
            {`TRUE,`GEW},{`FALSE,`GEW}: {out,nextstate}={6'b001_100,`YEW};
            {`TRUE,`YEW},{`FALSE,`YEW}: {out,nextstate}={6'b001_010,`RBW1};
            {`TRUE,`RBW1},{`FALSE,`RBW1}: {out,nextstate}={6'b001_001,`GNS};
            default:{out ,nextstate}= {6'bxxxxxx,3'bxxx};
        endcase
    end



 endmodule