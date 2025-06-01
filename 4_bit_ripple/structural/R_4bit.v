module FA(input a,b,cin, output sum, cout);
  assign sum=(a ^ b ^ cin);
  assign cout=(a & b) | (cin & (a ^ b));
endmodule
module R_4bit(input [3:0] a,b, input cin, output [3:0] sum, output cout);
  wire [4:0] c;
  assign c[0]=cin;
  genvar i;
  generate
    for(i=0;i<4;i=i+1) begin
      FA fi(.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum[i]),.cout(c[i+1]));
    end
    endgenerate
    assign cout=c[4];
endmodule