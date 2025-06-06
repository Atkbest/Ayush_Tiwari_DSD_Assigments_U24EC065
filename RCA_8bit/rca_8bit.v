module rca_8bit(input wire [7:0] a,b, input wire cin, output reg [7:0] sum, output reg cout);
  reg [8:0] c;
  integer i;
  always @(*) begin
    c[0]=cin;
    for(i=0; i<8; i=i+1) begin
      {c[i+1],sum[i]}=a[i]+b[i]+c[i];
    end
    cout=c[8];
  end
endmodule