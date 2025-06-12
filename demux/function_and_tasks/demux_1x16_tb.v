module demux_1x16_tb;
  reg i;
  reg [3:0] m;
  wire[15:0] o;

  demux_1x16 uut(.i(i), .m(m),.o(o));

  initial begin
    $dumpfile("demux_1x16.vcd");
    $dumpvars;
  end
  assign i=1'b1;
  task value_assign;
    input [3:0] value;
    begin
      m = value;
      #1;
      $display("Input: %b,Select line:%b, o: %b", i,m,o);
    end
  endtask

  initial begin
    integer j;
    for (j = 0; j < 16; j = j + 1) begin   
      value_assign(j);        
    end
    $finish;
  end

endmodule
