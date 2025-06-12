module basic_gates(input [3:0] in, input x,y, output o);
  function [0:0] mux;
    input [1:0] i;
    input m;
    begin
      mux=(m)?i[1]:i[0];
    end
  endfunction
  casez(1'b1)
    in[0]:o=mux({1'b0,x},y);//and gate
    in[1]:o=mux({x,1'b1},y);//or gate
    in[2]:o=mux({x,~x},y);//xor gate
    in[3]:o=mux({1'b1,~x},y);//nand gate
  endcase
endmodule