`timescale 1ns / 1ps

module tb_sync_3bit;
  reg in_clk, in_m, in_rst;
  wire [2:0] o_q;

  sync_3bit uut (
    .in_clk(in_clk),
    .in_m(in_m),
    .in_rst(in_rst),
    .o_q(o_q)
  );

  integer i, j;

  initial begin
    $display("Synchronous 3-bit up/down counter test");

    // Reset sequence
    in_rst = 1;
    in_clk = 0;
    #5;
    in_clk = 1;
    #5;
    in_rst = 0;

    // UP COUNTING
    in_m = 1'b1;
    for (i = 0; i < 8; i = i + 1) begin
      in_clk = 0; #10;
      in_clk = 1; #1;
      $display("Up Counting: %b", o_q);
      #9;
    end

    // DOWN COUNTING
    in_m = 1'b0;
    for (j = 0; j < 8; j = j + 1) begin
      in_clk = 0; #10;
      in_clk = 1; #1;
      $display("Down Counting: %b", o_q);
      #9;
    end

    $finish;
  end
endmodule

