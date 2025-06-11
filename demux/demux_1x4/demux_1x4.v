module demux_1x4(input wire i, input wire [1:0] s,output reg [3:0] o);
  always @(*) begin
	o=4'b0000;
    o[s]=i;
  end
endmodule