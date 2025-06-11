module bcd_enc_tb;
  reg [9:0] d;
  wire [3:0] bcd;
  
  bcd_enc uut(.d(d),.bcd(bcd));
  
  initial begin
    $dumpfile("bcd_enc.vcd");
    $dumpvars;
  end
  
  initial begin
    $display("bcd encoder testbench");
    for(int i=0;i<10;i++) begin
      d=9'b0000000000;
      d[i]=1'b1;
      #1;
      $display("decimal:%b ,bcd:%b",d,bcd);
      #10;
    end
    $finish;
  end
endmodule