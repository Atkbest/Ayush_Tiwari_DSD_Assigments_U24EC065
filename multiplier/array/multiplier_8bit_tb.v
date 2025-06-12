module multiplier_8bit_tb;
  reg [7:0] a,b;
  wire [15:0] o;
  
  multiplier_8bit uut(.a(a),.b(b),.o(o));
  
  initial begin
    $dumpfile("multiplier_8bit.vcd");
    $dumpvars;
  end
  
  initial begin
    reg [16:0] value;
    
    a=8'b10110110;
    b=8'b11100101;
    value=a*b;
    #1;
    $display("a:%b, b:%b, output:%b, actual:%b",a,b,o,value);
    #10
  $finish;
  end
endmodule