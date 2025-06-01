module FA_3bit(input wire [2:0] a,b,input wire cin, output reg [2:0]sum,output reg cout);
  always @(*) begin
    {cout,sum}=a+b+cin;
  end
endmodule