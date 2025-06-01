module FA_3bit(input [2:0] a,b, input cin, output [2:0] sum, output cout);
  wire [3:0] w;
  assign w[0]=cin;
  genvar i;
  generate
  for(i=0;i<3;i=i+1) begin
    assign sum[i]=a[i]^b[i]^w[i];
    assign w[i+1]=(a[i]&b[i])|(w[i]&(a[i]^b[i]));
  end
  endgenerate
  assign cout=w[3];
endmodule
    