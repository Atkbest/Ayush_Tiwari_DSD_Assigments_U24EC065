module dec_3x8_tb;
  reg [2:0] i;
  wire [7:0] o;
  
  dec_3x8 uut(.i(i),.o(o));
  
  initial begin
    $dumpfile("dec_3x8.vcd");
    $dumpvars;
  end
  
  task value_assign;
    input [2:0] value;
    begin
      i = value;
      #1;
      $display("Input: %b, Output: %b", i,o);
    end
  endtask

  initial begin
    integer j;
    for (j = 0; j < 8; j = j + 1) begin   
      value_assign(j);        
    end
    $finish;
  end

endmodule