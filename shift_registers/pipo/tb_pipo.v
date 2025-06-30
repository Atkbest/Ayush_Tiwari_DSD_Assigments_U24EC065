module tb_pipo;
  reg [3:0] in_l;
  reg in_clk;
  reg in_rst;
  wire [3:0] o_q;
  integer i;
  
  pipo dut(.in_l(in_l),.in_clk(in_clk),.in_rst(in_rst),.o_q(o_q));
  
  initial begin
    in_clk=1'b0;
    #5;
    in_clk=1'b1;
    in_rst=1'b1;
    #1;
    in_rst=1'b0;
    #4;
    for(i=0;i<16;i=i+1) begin
      in_clk=1'b0;
      #5;
      in_clk=1'b1;
      in_l=i;
      #1;
      $display("Input: %b | Output: %b", in_l, o_q);
      #4;
    end
    $finish;
  end
endmodule
