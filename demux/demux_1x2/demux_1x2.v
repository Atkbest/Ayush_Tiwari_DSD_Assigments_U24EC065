module demux_1x2(input wire i, input wire s,output reg [1:0] o);
  always @(*) begin
	o=2'b00;
    o[s]=i;
  end
endmodule
