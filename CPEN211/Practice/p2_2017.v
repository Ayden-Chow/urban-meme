module calc(clk, reset, s, in, op, out, ovf, done);
    input clk, reset, s;
    input [7:0] in;
    input [1:0] op;
    output [7:0] out;
    output ovf, done;

    datapath DP(in,selA,loadA,op,loadB,loadV,zero,ovf,out);
endmodule


module datapath(in,selA,loadA,op,loadB,loadV,zero,ovf,out);
    input selA, loadA,loadB,  loadV;
    input [1:0] op;
    input [7:0]in;
    output zero,ovf;
    output [7:0]out;

endmodule

module alu(op,)

module vDFFE(clk, write, data_in, data_out);
    parameter n= 1;
    input clk, write;
    input [n-1:0] data_in;
    output reg [n-1:0] data_out;
    wire [n-1:0] next_out;

    assign next_out = write ? data_in : data_out;
    //describes the sequential nature of the flip flop
    always @(posedge clk) begin
        data_out = next_out;
    end
endmodule