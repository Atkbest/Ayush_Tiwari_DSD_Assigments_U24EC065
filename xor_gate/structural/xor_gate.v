module nand_gate(input a,input b,output y);
  assign y=~(a&b);
endmodule

module xor_gate(input i1, input i2, output z);
  wire w1,w2,w3;
  
  nand_gate n1(.a(i1), .b(i2), .y(w1));
  nand_gate n2(.a(i1), .b(w1), .y(w2));
  nand_gate n3(.a(i2), .b(w1), .y(w3));
  nand_gate n4(.a(w2), .b(w3), .y(z));

endmodule