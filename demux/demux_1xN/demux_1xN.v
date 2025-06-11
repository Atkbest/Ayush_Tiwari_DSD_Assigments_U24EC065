module demux_1xN#(N=4)(input wire i, input wire [$clog2(N)-1:0] s,output reg [N-1:0] o);
  always @(*) begin
    o = {N{1'b0}};
    o[s]=i;
  end
endmodule