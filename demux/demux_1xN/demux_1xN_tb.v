module demux_1x4_tb;
  reg i;
  reg [1:0] s;
  wire [3:0] o;
  
  demux_1xN uut(.i(i),.s(s),.o(o));
  
  initial begin
    $dumpfile("demux_1x4.vcd");
    $dumpvars;
  end
  
  initial begin
    $display("demux testbench");
    i=1'b1;
    for(int j=0;j<4;j++) begin
      s=j;
      #1;
      $display("i= %b, s=%b, o=%b,",i,s,o);
      #10;
    end
    $finish;
  end
endmodule

