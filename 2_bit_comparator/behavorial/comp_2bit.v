module comp_2bit(input wire [1:0] a, b, output reg s1, s2, s3);
  always @(*) begin
    s1 = 0;
    s2 = 0;
    s3 = 0;

    if (a > b)
      s1 = 1;
    else if (a == b)
      s2 = 1;
    else
      s3 = 1;
  end
endmodule
         