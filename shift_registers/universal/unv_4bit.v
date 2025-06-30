module dff(input wire d,clk,rst,output reg q);
  always @(posedge clk) begin
    if(rst)
      q<=1'b0;
  	else 
      q<=d;
  end
endmodule

module mux(input wire x0,x1,x2,x3, input wire [1:0] m, output reg y);
  always @(*) begin
   case(m)
     2'b00:y=x0;//hold
     2'b01:y=x1;//shift right
     2'b10:y=x2;//shift left
     2'b11:y=x3;//parallel load
    default: ;
   endcase
  end
endmodule
    
module unv_4bit(input [3:0] in_l, input in_clk,in_rst,in_sir,in_sil, input [1:0] in_m, output [3:0] o_q);
  wire [3:0] q;
  wire [3:0] d;
  
  mux m3(.x3(in_l[3]),.x2(q[2]),.x1(in_sir),.x0(q[3]),.m(in_m),.y(d[3]));
  mux m2(.x3(in_l[2]),.x2(q[1]),.x1(q[3]),.x0(q[2]),.m(in_m),.y(d[2]));
  mux m1(.x3(in_l[1]),.x2(q[0]),.x1(q[2]),.x0(q[1]),.m(in_m),.y(d[1]));
  mux m0(.x3(in_l[0]),.x2(in_sil),.x1(q[1]),.x0(q[0]),.m(in_m),.y(d[0]));
 
  dff f3(.d(d[3]),.clk(in_clk),.rst(in_rst),.q(q[3]));
  dff f2(.d(d[2]),.clk(in_clk),.rst(in_rst),.q(q[2]));
  dff f1(.d(d[1]),.clk(in_clk),.rst(in_rst),.q(q[1]));
  dff f0(.d(d[0]),.clk(in_clk),.rst(in_rst),.q(q[0]));
  
  assign o_q=q;
endmodule 