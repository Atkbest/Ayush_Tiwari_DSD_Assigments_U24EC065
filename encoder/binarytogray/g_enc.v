module g_enc(input wire [3:0] b, output reg [3:0] g);
  always @(*) begin
    g[3]=b[3];
    for(int j=2;j>=0;j=j-1) begin
      g[j]=b[j]^b[j+1];
    end
  end
endmodule