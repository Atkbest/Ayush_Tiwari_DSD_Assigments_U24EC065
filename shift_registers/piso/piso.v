module dff(input wire d,clk,rst,output reg q);
  always @(posedge clk) begin
    if(rst)
      q<=1'b0;
  	else 
      q<=d;
  end
endmodule

module piso(input [3:0] in_l, input in_clk, in_rst,in_s,in_si, output o_q);
  wire [3:0] q;
  wire [3:0] d;
  
  assign d[3]=(in_s)?in_si:in_l[3];
  assign d[2]=(in_s)?q[3]:in_l[2];
  assign d[1]=(in_s)?q[2]:in_l[1];
  assign d[0]=(in_s)?q[1]:in_l[0];

  dff f3(.d(d[3]),.clk(in_clk),.rst(in_rst),.q(q[3]));
  dff f2(.d(d[2]),.clk(in_clk),.rst(in_rst),.q(q[2]));
  dff f1(.d(d[1]),.clk(in_clk),.rst(in_rst),.q(q[1]));
  dff f0(.d(d[0]),.clk(in_clk),.rst(in_rst),.q(q[0]));
  
  assign o_q=q[0];
endmodule 