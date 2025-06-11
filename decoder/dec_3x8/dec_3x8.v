module dec_3x8(input wire x,y,z,en, output reg [7:0] o);
  reg [2:0] inp;
  always @(*) begin
    inp={x,y,z};
    if(en==1) begin
      o=8'b0;
      o[inp]=1;
    end
    else 
      o=8'b0;
  end
endmodule