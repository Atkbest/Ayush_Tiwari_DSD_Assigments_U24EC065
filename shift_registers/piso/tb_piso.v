`timescale 1ns / 1ps

module tb_piso;
  reg [3:0] in_l;
  reg in_clk, in_rst, in_s, in_si;
  wire o_q;

  piso uut (
    .in_l(in_l),
    .in_clk(in_clk),
    .in_rst(in_rst),
    .in_s(in_s),
    .in_si(in_si),
    .o_q(o_q)
  );

  integer i;

  initial begin
    $display("Starting PISO test...");

    in_clk = 0;
    in_rst = 1;
    in_s = 0;
    in_si = 0;
    in_l = 4'b0000;
    toggle_clk(); 
    in_rst = 0;

    
    in_l = 4'b1101;
    in_s = 0; 
    toggle_clk();

    in_s = 1;
    in_si = 0;
    $display("Shifting out 1101:");
    for (i = 0; i < 4; i = i + 1) begin
      toggle_clk();
      $display("o_q = %b", o_q);
    end

    in_s = 0;
    in_l = 4'b1101;  
    toggle_clk();     

    in_s = 1;
    in_si = 1;
    $display("Shifting with in_si = 1:");
    for (i = 0; i < 4; i = i + 1) begin
      toggle_clk();
      $display("o_q = %b", o_q);
    end

    $finish;
  end

  task toggle_clk;
    begin
      #5 in_clk = 1;
      #5 in_clk = 0;
    end
  endtask
endmodule
