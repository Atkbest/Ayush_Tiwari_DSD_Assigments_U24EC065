module enc_8x3_tb;
  reg [7:0] i;
  wire [2:0] o;

  enc_8x3 uut(.i(i), .o(o));

  initial begin
    $dumpfile("enc_8x3.vcd");
    $dumpvars;
  end

  task value_assign;
    input [7:0] value;
    begin
      i = value;
      #1;
      $display("Input: %b, Output: %b", i, o);
    end
  endtask

  task bit_value;
    input integer j;
    output [7:0] a;
    begin 
      a = 8'b00000000;
      a[j] = 1'b1;
    end
  endtask

  initial begin
    integer j;
    reg [7:0] a; 
    for (j = 0; j < 8; j = j + 1) begin
      bit_value(j, a);         
      value_assign(a);        
    end
    $finish;
  end

endmodule