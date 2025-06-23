
module button(input wire in_b,in_clk, output reg o_q);
  reg b_d;//delay signal
  always @(posedge in_clk) begin
    b_d<=in_b;
    o_q<=~b_d&in_b;
  end
endmodule
