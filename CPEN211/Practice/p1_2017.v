 module top_module(clk,reset,in,out);
    input clk,reset;
    input [1:0] in;
    output reg out;
    wire [1:0] current_state, next_state_reset;
    reg [1:0] next_state;

    `define A 3'b000
    `define B 3'b001
    `define C 3'b010
    `define D 3'b011
    `define E 3'b100

    `define ctl_out {next_state, out}

    assign next_state_reset=reset?`A:next_state;

    vDFF fsm(.clk(clk),.D(next_state_reset),.Q(current_state));

    always @(*) begin
        casex({in,current_state)
            {2'b11,`A}:`ctl_out={`B,2'b01};
            {2'b00,`A}:`ctl_out={`C,2'b01};
            {2'bxx,`A}:`ctl_out={`A,2'b01};

            {2'b01,`B}:`ctl_out={`E,2'b11};
            {2'bxx,`B}:`ctl_out={`B,2'b11};

            {2'b01,`C}:`ctl_out={`B,2'b10};
            {2'b11,`C}:`ctl_out={`E,2'b10};
            {2'b10,`C}:`ctl_out={`D,2'b10};
            {2'bxx,`C}:`ctl_out={`C,2'b10};

            {2'bxx,`D}:`ctl_out={`C,2'b11};

            {2'b00,`E}:`ctl_out={`D,2'b00};
            {2'bxx,`E}:`ctl_out={`E,2'b00};
            default:`ctl_out= 5'bxxxxx
        endcase
    end


endmodule
 module vDFF(clk,D,Q);
  parameter n=1;
  input clk;
  input [n-1:0] D;
  output [n-1:0] Q;
  reg [n-1:0] Q;
  always @(posedge clk)
    Q <= D;
endmodule