module mux_2x1(input [1:0] i, input m, output x);
  assign x=(m==0)?i[0]:i[1];
endmodule