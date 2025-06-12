module mux_16x1_tb;
  reg [15:0] i;
  reg [3:0] m;
  wire x;

  mux_16x1 uut(.i(i), .m(m),.x(x));

  initial begin
    $dumpfile("mux_16x1.vcd");
    $dumpvars;
  end
  assign i=16'b1011100101110010;
  task value_assign;
    input [3:0] value;
    begin
      m = value;
      #1;
      $display("Input: %b,Select line:%b, x: %b", i,m,x);
    end
  endtask

  initial begin
    integer j;
    reg [7:0] a; 
    for (j = 0; j < 16; j = j + 1) begin   
      value_assign(j);        
    end
    $finish;
  end

endmodule
