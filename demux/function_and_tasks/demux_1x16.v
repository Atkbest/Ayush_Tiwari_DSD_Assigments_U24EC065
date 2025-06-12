module demux_1x16(input i, input [3:0] m,output [15:0] o);
  assign o=demux(i,m);
  
  function [15:0] demux;
    input in;
    input [3:0] s;
    begin
      demux={16{1'b0}};
      demux[s]=in;
    end
  endfunction
endmodule