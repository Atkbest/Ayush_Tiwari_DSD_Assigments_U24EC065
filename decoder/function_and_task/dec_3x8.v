module dec_3x8(input [2:0] i, output [7:0] o);
  assign o= decode(i);
  
  function [7:0] decode;
    input [3:0] in;
    begin
      decode=8'b00000000;
      decode[in]=1'b1;
    end
  endfunction
endmodule