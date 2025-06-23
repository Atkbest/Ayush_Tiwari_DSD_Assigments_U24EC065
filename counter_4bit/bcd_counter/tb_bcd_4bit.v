module tb_bcd_4bit;
  reg in_clk, in_rst;
  wire [3:0] o_q;
  integer i;
  
  bcd_4bit dut(.in_clk(in_clk),.in_rst(in_rst),.o_q(o_q));
  
  initial begin
  in_clk=1'b1;
  in_rst=1'b1;
  #1;
  in_rst=1'b0;
  #4;
  in_clk=1'b0;
  #5;
    for(i=0;i<15;i=i+1) begin
    in_clk=1'b1;
    #5;
    in_clk=1'b0;
    #5;
    end
  $finish;
  end
endmodule