module HA(input a,b, output sum,cout);
  assign sum=a^b;
  assign cout=a&b;
endmodule

module FA(input a,b,cin, output sum,cout);
  wire s1, s2, s3;
  HA h1(.a(a),.b(b),.sum(s1),.cout(s2));
  HA h2(.a(s1),.b(cin),.sum(sum),.cout(s3));
  assign cout=s2|s3;
endmodule