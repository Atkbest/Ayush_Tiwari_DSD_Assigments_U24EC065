module tb_siso;
  reg in_l,in_clk,in_rst;
  wire o_q;
  integer i;
  reg [7:0] inp;
  
  siso dut(.in_l(in_l),.in_clk(in_clk),.in_rst(in_rst),.o_q(o_q));
  
  initial begin
    
    inp=8'b11000101;
    in_clk=1'b1;
    in_rst=1'b1;
    #5;
    in_clk=1'b0;
    #5;
    in_clk=1'b1;
    in_rst=1'b0;
    #5;
    in_clk=1'b0;
    #5;
    for(i=0;i<8;i=i+1) begin
      in_clk=1'b1;
      in_l=inp[i];
      #5;
      in_clk=1'b0;
      #5;
    end
    $finish;
  end
endmodule