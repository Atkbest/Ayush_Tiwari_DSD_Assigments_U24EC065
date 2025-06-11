module enc_4x2(input wire [3:0] i, input wire en, output reg [1:0] o);
  always @(*) begin
    o=2'b00;
    if(en) begin
      for(int j=0;j<4;j++) begin
      if(i[j]) o=j;
    end 
    end
  end
endmodule

module enc_8x3(input [7:0] i, input en, output [2:0] o);

  wire a;
  assign a= i[7]|i[6]|i[5]|i[4];
  enc_4x2 e1(.i(i[3:0]|i[7:4]),.en(en),.o(o[1:0]));
  assign o[2]= a;
endmodule