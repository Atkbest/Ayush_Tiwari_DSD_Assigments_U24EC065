`timescale 1ns / 1ps
module tb_button;
  reg in_b, in_clk;
  wire o_q;
  integer i;
  
  button dut(.in_b(in_b),.in_clk(in_clk),.o_q(o_q));
  
  initial begin  
    for(i=0;i<7;i=i+1) begin
    in_clk=1'b0;
    #10;
    in_clk=1'b1;
    #10;
    end
  end
  initial begin
    in_b=1'b0;
    #30;
    in_b=1'b1;
    #60;
    in_b=1'b0;
    #20;
    in_b=1'b1;
    #20;
    in_b=1'b0;
    #20;
    $finish;
  end
endmodule
    
