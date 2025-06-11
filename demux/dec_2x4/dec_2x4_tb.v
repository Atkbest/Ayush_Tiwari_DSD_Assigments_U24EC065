module dec_2x4_tb;
  reg x,y,en;
  wire [3:0] o;
  
  dec_2x4 uut(.x(x),.y(y),.en(en),.o(o));
  
  initial begin
    $dumpfile("dec_2x4.vcd");
    $dumpvars;
  end
  
  initial begin
    for(int i=0;i<8;i++) begin
      {x,y,en}=i;
      #10;
    end
    $finish;
  end
endmodule