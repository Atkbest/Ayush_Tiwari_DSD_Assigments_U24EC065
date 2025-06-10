module mux_4x1(input wire [3:0] i, input wire [1:0] m, output reg x);
  always @(*) begin
    x=i[m];
  end
endmodule