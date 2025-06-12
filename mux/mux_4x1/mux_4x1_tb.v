module mux_4x1_tb;
  reg [3:0] i;
  reg [1:0] m;
  wire x;

  mux_4x1 uut(.i(i), .m(m), .x(x));

  initial begin
    $dumpfile("mux_4x1.vcd");
    $dumpvars;
	end
	
  initial begin
    i = 4'b1010;
    for (int j = 0; j < 4; j++) begin
      m = j;
      #5;
      $display("i = %b, m = %b, x = %b", i, m, x);
    end
    $finish;
  end
endmodule
