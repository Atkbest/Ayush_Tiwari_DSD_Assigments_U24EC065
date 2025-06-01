module FA_3bit_tb;
  reg [2:0] a,b;
  reg cin;
  wire [2:0] sum;
  wire cout;
  
  FA_3bit uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
  
  integer i,j,k;
  initial begin
    $dumpfile("FA_3bit.vcd");
    $dumpvars;
  end
  initial begin
    for(i=0;i<8;i=i+1)begin
      for(j=0;j<8;j=j+1)begin
        for(k=0;k<2;k=k+1)begin
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