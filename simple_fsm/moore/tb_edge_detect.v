module tb_edge_detect;
  reg in_i, in_clk, in_rst;
  wire o_q;
  integer i;
  
  edge_detect_moore dut(.in_i(in_i),.in_clk(in_clk),.in_rst(in_rst),.o_q(o_q));
  
  initial begin
  #10;
  in_rst=1'b1;
  #1;
  in_rst=1'b0;
  end
  
  initial begin
  in_i=1'b0;
  #15;
  in_i=1'b1;
  #105;
  in_i=1'b0;
  end
  
  initial begin
  for(i=0;i<8;i=i+1) begin
  in_clk=1'b0;
  #10;
  in_clk=1'b1;
  #10;
  end
  in_clk=1'b0;
  #10;
  $finish;
  end
  always @(posedge in_clk) begin
    $display("Time=%0t | in_i=%b | o_q=%b | State=%0d", $time, in_i, o_q, dut.p_st);
  end
endmodule