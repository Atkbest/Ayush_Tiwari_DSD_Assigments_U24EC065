module edge_detect(input in_i,in_clk,in_rst, output reg o_q);//mealy
  localparam L=2'b00, H=2'b01, TEMP=2'b10;
  reg [1:0] p_st, n_st;//present and next state
  
  always @(posedge in_clk or posedge in_rst) begin
    if(in_rst)
      p_st<=L;
    else begin
      p_st<=n_st;
      case(p_st)
      L:o_q=(in_i)?1'b1:1'b0;
      H:o_q=1'b0;
      TEMP:o_q=(in_i)?1'b0:1'b1;
      default:o_q=1'b0;
      endcase
    end
  end
  always @(*) begin
    case(p_st)
      L:n_st=(in_i)?H:p_st;
      H:n_st=(in_i)?TEMP:L;
      TEMP:n_st=(in_i)?p_st:L;
      default:n_st=L;
    endcase
  end
endmodule