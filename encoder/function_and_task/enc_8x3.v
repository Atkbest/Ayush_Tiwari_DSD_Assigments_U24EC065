module enc_8x3(input [7:0] i, output [2:0] o);
  assign o=encode(i);
  
  function [2:0] encode;
    input [7:0] in;
    begin
      casez(in)
        8'b1???????:encode=3'b111;
        8'b01??????:encode=3'b110;
        8'b001?????:encode=3'b101;
        8'b0001????:encode=3'b100;
        8'b00001???:encode=3'b011;
        8'b000001??:encode=3'b010;
        8'b0000001?:encode=3'b001;
        8'b00000001:encode=3'b000;
        default:encode=3'b000;
      endcase
    end
  endfunction
endmodule
