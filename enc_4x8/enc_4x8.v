module enc_4x2(input wire [3:0] i, input wire en, output reg [1:0] o);
  always @(*) begin
    o=2'b00;
    if(en) begin
      for(int j=0;j<4;j++) begin
      if(i[j])
        o=j[1:0];
    end 
    end
  end
endmodule