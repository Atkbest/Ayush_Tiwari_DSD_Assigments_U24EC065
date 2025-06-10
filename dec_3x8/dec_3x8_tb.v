module dec_3x8_tb;
  reg x,y,z,en;
  wire [7:0] o;
  
  dec_3x8 uut(.x(x),.y(y),.z(z),.en(en),.o(o));
  
  initial begin
    $dumpfile("dec_3x8.vcd");
    $dumpvars;
  end
  
  initial begin
    for(int i=0;i<16;i++) begin
      {x,y,z,en}=i;
      #10;
    end
    $finish;
  end
endmodule
