module bcd_enc(input wire [9:0] d, output reg [3:0] bcd);
  always @(*) begin
    case(1'b1)
      d[0]: bcd = 4'd0;
      d[1]: bcd = 4'd1;
      d[2]: bcd = 4'd2;
      d[3]: bcd = 4'd3;
      d[4]: bcd = 4'd4;
      d[5]: bcd = 4'd5;
      d[6]: bcd = 4'd6;
      d[7]: bcd = 4'd7;
      d[8]: bcd = 4'd8;
      d[9]: bcd = 4'd9;
      default:bcd=4'b0000;
    endcase
  end
endmodule