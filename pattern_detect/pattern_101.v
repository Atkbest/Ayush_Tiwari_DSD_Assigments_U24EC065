module pattern_101(input in_p, input in_clk, in_rst, output reg o_d);//non overlapping
  localparam ZERO=2'b00, ONE=2'b01, TWO=2'b10, THREE=2'b11;
  reg [1:0] p_st, n_st;
  always @(posedge in_clk or in_rst)begin
    if(in_rst)
      p_st<=ZERO;
    else 
      p_st<=n_st;
  end
  always @(*) begin
   o_d=(in_p==1'b1 && p_st==TWO)?1'b1:1'b0;
   end
  
  always @(*) begin
     case(p_st)
       ZERO:n_st=(in_p)?ONE:p_st;
       ONE:n_st=(in_p)?THREE:TWO;
       TWO:n_st=ZERO;
       THREE:n_st=(in_p)?p_st:TWO;
     endcase
  end
endmodule