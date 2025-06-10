module mux_Nx1 #(N=4)(input wire [N-1:0] i, input wire [$clog2(N)-1:0] m, output reg x);
  always @(*) begin
    x=i[m];
  end
endmodule

