module R_4bit(input [3:0] a,b, input cin, output [3:0] sum, output cout);
  wire [4:0] w;
  assign w[0]=cin;
  genvar i;
  generate
  for(i=0;i<4;i=i+1) begin
    assign sum[i]=a[i]^b[i]^w[i];
    assign w[i+1]=(a[i]&b[i])|(w[i]&(a[i]^b[i]));
  end
  endgenerate
  assign cout=w[4];
endmodule