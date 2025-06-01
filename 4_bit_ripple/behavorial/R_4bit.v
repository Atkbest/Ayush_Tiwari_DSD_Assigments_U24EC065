module R_4bit(input wire [3:0] a,b, input wire cin, output reg [3:0] sum, output reg cout);
  always @(*) begin
    {cout,sum}=a+b+cin;
  end
endmodule