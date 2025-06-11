module demux_1x2_tb;
  reg i,s;
  wire [1:0] o;
  
  demux_1x2 uut(.i(i),.s(s),.o(o));
  
  initial begin
    $dumpfile("demux_1x2.vcd");
    $dumpvars;
  end
  
  initial begin
    $display("demux testbench");
    i=1'b1;
    for(int j=0;j<2;j++) begin
      s=j;
      #1;
      $display("i= %b, s=%b, o=%b,",i,s,o);
      #10;
    end
    $finish;
  end
endmodule

    
    

