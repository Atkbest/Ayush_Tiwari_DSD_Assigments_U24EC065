module tb_jcounter;
  reg in_clk, in_clr, in_prst;
  wire [3:0] o_q;
  integer i;
  
  jcounter dut(.in_clk(in_clk),.in_clr(in_clr),.in_prst(in_prst),.o_q(o_q));
  
  initial begin
    in_clk=1'b0;
    #5
    in_clk=1'b1;
    in_clr=1'b1;
    in_prst=1'b1;
    #1
    in_clr=1'b0;
    in_prst=1'b0;
    #4;
    in_clk=1'b0;
    #5;
    for(i=0;i<7;i=i+1) begin
    in_clk=1'b1;
    #5;
    in_clk=1'b0;
    #5;
    end
  $finish;
  end
endmodule
