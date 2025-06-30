module dff(input wire d,clk,rst,output reg q);
  always @(posedge clk) begin
    if(rst)
      q<=1'b0;
  	else 
      q<=d;
  end
endmodule

module pipo(input [3:0] in_l, input in_clk, in_rst, output [3:0] o_q);
  wire [3:0] q;
  dff f0(.d(in_l[0]),.clk(in_clk),.rst(in_rst),.q(o_q[0]));
  dff f1(.d(in_l[1]),.clk(in_clk),.rst(in_rst),.q(o_q[1]));
  dff f2(.d(in_l[2]),.clk(in_clk),.rst(in_rst),.q(o_q[2]));
  dff f3(.d(in_l[3]),.clk(in_clk),.rst(in_rst),.q(o_q[3]));
endmodule 