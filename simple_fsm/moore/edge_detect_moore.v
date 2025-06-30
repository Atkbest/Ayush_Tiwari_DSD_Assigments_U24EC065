module edge_detect_moore(input in_i,in_clk,in_rst, output reg o_q);//mealy
  localparam L=2'b00, H=2'b01, H_L=2'b10, L_H=2'b11;
  reg [1:0] p_st, n_st;//present and next state
  
  always @(posedge in_clk or posedge in_rst) begin
    if(in_rst)
      p_st<=L_H;
    else
      p_st<=n_st;
  end
  
  always @(*) begin
    case(p_st)
      L,H:o_q=1'b1;
      default:o_q=1'b0;
    endcase
  end
  
  always @(*) begin
    case(p_st)
      L:n_st=(in_i)?H:L_H;
      H:n_st=(in_i)?H_L:L;
      L_H:n_st=(in_i)?H:p_st;
      H_L:n_st=(in_i)?p_st:L;
      default:n_st=L_H;
    endcase
  end
endmodule