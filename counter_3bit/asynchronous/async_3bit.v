module tff(input wire in_t,in_clk,in_rst, output reg o_q);
  always @(posedge in_clk or posedge in_rst) begin
    if(in_rst)
      o_q<=1'b0;
    else
      o_q<=(in_t)?~o_q:o_q;
  end
endmodule
module async_3bit(input in_clk, in_m, in_rst, output [2:0] o_q);
  wire [2:0] t;
  wire [2:0] q;
  wire [1:0] clk;
  
  assign clk=2'b00;
  
  assign clk[0]=(in_m)?~q[0]:q[0];
  assign clk[1]=(in_m)?~q[1]:q[1];
  
  assign t[0]=1'b1;
  assign t[1]=1'b1;
  assign t[2]=1'b1;
  

  
  tff f0(.in_t(t[0]),.in_clk(in_clk),.in_rst(in_rst),.o_q(q[0]));
  tff f1(.in_t(t[1]),.in_clk(clk[0]),.in_rst(in_rst),.o_q(q[1]));
  tff f2(.in_t(t[2]),.in_clk(clk[1]),.in_rst(in_rst),.o_q(q[2]));
  
  assign o_q=q;
endmodule