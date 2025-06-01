module R_4bit_tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  
  R_4bit uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  initial begin
    $dumpfile("R_4bit.vcd");
    $dumpvars;
  end
  integer i,j,k;
  initial begin
    for(i=0;i<4;i=i+1) begin
      for(j=0;j<4;j=j+1) begin
        for(k=0;k<2;k=k+1) begin
          a=i;
          b=j;
          cin=k;
          #10;
        end
      end
    end
  $finish;
  end
endmodule