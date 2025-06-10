module dec_2x4(input wire x,y,en, output reg [3:0] o);
  reg [1:0] inp;
  always @(*) begin
    inp={x,y};
    if(en==1) begin
      o=4'b0;
      o[inp]=1;
    end
    else 
      o=4'b0;
  end
endmodule