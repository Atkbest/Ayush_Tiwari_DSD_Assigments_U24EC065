module tb_pattern_101;
  reg in_p;
  reg [31:0] bit_stream;
  reg in_clk, in_rst;
  wire o_d;
  integer i;
  
  pattern_101 dut(.in_p(in_p),.in_clk(in_clk),.in_rst(in_rst),.o_d(o_d));
  
  always begin
    #5 in_clk=~in_clk;
  end
  
  initial begin
  in_clk = 0;
  in_rst = 1;
  in_p = 0;
  bit_stream = 32'b00110010001010110010010001011101;
  #20 in_rst = 0;

  for (i = 0; i < 32; i = i + 1) begin
    @(posedge in_clk);  // waits for clock edge
    in_p = bit_stream[31 - i];
    $display("Time=%0t | Bit[%0d]=%b | FSM State=%0d | Pattern Detected=%b",
              $time, 31 - i, in_p, dut.p_st, o_d);
  end
end

  
  initial begin
    #400 $finish;
  end
endmodule