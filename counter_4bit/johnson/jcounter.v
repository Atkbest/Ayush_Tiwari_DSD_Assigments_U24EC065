module dff(input wire d,clk,clr,prst, output reg q);
  always @(posedge clk) begin
    case(1'b1)
      clr:q<=1'b0;
      prst:q<=1'b1;
      default:q<=d;
    endcase
  end
endmodule
module jcounter(input wire in_clk, in_clr, in_prst, output wire [3:0] o_q);
  wire [3:0] q;
  
  dff f0(.d(q[1]), .clk(in_clk), .clr(in_clr), .prst(1'b0), .q(q[0]));
  dff f1(.d(q[2]), .clk(in_clk), .clr(in_clr), .prst(1'b0), .q(q[1]));
  dff f2(.d(q[3]), .clk(in_clk), .clr(in_clr), .prst(1'b0), .q(q[2]));
  dff f3(.d(~q[0]), .clk(in_clk), .clr(1'b0), .prst(in_prst), .q(q[3]));
  assign o_q=q;
endmodule