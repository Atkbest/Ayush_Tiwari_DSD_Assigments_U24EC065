module dff(input wire d,clk,rst,output reg q);
  always @(posedge clk) begin
    if(rst)
      q<=1'b0;
  	else 
      q<=d;
  end
endmodule

module siso(input in_l, input in_clk, in_rst, output o_q);
  wire [3:0] q;
 
  dff f3(.d(in_l),.clk(in_clk),.rst(in_rst),.q(q[3]));
  dff f2(.d(q[3]),.clk(in_clk),.rst(in_rst),.q(q[2]));
  dff f1(.d(q[2]),.clk(in_clk),.rst(in_rst),.q(q[1]));
  dff f0(.d(q[1]),.clk(in_clk),.rst(in_rst),.q(q[0]));
  
  assign o_q=q[0];
endmodule 