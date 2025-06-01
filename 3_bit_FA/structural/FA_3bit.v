module FA(input a,b,cin, output sum, cout);
  assign sum=(a^b^cin);
  assign cout=a&b|cin&(a^b);
endmodule
module FA_3bit(input [2:0] a,b,input cin, output [2:0] sum, output cout);
wire c1,c2;
  FA f1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
  FA f2(.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
  FA f3(.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(cout));
endmodule	