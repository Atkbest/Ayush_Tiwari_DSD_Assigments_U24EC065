module reg_16x16(input [15:0] in_w_data, input [3:0] in_w_add, in_r_add1, in_r_add2, input in_w_en, in_clk, in_rst, output reg [15:0] o_r_data1, o_r_data2);
  reg [15:0] reg_file [0:15];
  integer i;
  always @(posedge in_clk or posedge in_rst) begin
    if(in_rst) begin
      for(i=0;i<16;i=i+1)
        reg_file[i]<=16'b0;
    end
    else if(in_w_en) begin
      reg_file[in_w_add]<=in_w_data;
    end
  end
  
  always @(*) begin
    o_r_data1=reg_file[in_r_add1];
    o_r_data2=reg_file[in_r_add2];
  end
endmodule