module mux_16x1(input wire [15:0] i, input wire [3:0] m, output wire x);
 assign x=mux(i,m);
  
  function [0:0] mux;
    input [15:0] in;
    input [3:0] s;
    begin
      mux=in[s];
    end
  endfunction
endmodule