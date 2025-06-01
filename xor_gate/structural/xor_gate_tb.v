module xor_gate_tb();
  reg a,b;
  wire y;
  
  xor_gate uut( .i1(a), .i2(b), .z(y));
  
  initial begin
    $dumpfile("xor_gate.vcd");
    $dumpvars(0,xor_gate_tb);
  end
  
  initial begin
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
  $finish;
  end
endmodule