module tff(input wire in_t,in_clk,in_rst, output reg o_q);
  always @(posedge in_clk or posedge in_rst) begin
    if(in_rst)
      o_q<=1'b0;
    else
      o_q<=(in_t)?~o_q:o_q;
  end
endmodule
module bcd_4bit(input in_clk, in_rst, output [3:0] o_q);
  wire [3:0] t;
  wire [3:0] q;
  
  assign t[0]=1'b1;
  assign t[1]=q[0]&~q[3];
  assign t[2]=q[1]&q[0];
  assign t[3]=q[0]&((q[2]&q[1])|q[3]);
  
  tff f0(.in_t(t[0]),.in_clk(in_clk),.in_rst(in_rst),.o_q(q[0]));
  tff f1(.in_t(t[1]),.in_clk(in_clk),.in_rst(in_rst),.o_q(q[1]));
  tff f2(.in_t(t[2]),.in_clk(in_clk),.in_rst(in_rst),.o_q(q[2]));
  tff f3(.in_t(t[3]),.in_clk(in_clk),.in_rst(in_rst),.o_q(q[3]));
  assign o_q=q;
  
endmodule