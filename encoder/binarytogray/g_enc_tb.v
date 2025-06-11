module g_enc_tb;
  reg [3:0] b;
  wire [3:0] g;
  
  g_enc uut(.b(b),.g(g));
  
  initial begin
    $dumpfile("g_enc.vcd");
    $dumpvars;
  end
  
  initial begin
    $display("gray encoder testbench");
    for(int i=0;i<16;i++) begin
      b=i;
      #1;
      $display("binary:%b ,gray:%b",b,g);
      #10;
    end
    $finish;
  end
endmodule
