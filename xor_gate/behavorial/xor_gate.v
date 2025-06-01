module xor_gate(input wire a, input wire b, output reg y);
  always @(a or b) begin
    y=a^b;
  end
endmodule
