module comp_2bit_tb();
  reg [1:0] a,b;
  wire s1,s2,s3;
  comp_2bit uut(.a(a),.b(b),.s1(s1),.s2(s2),.s3(s3));
  
  
  integer b1,b2,b3,b4; //all 4 bits
  
  initial begin
    $dumpfile("comp_2bit.vcd");
    $dumpvars;
  end
  
  initial begin
  
    for(b1=0;b1<2;b1=b1+1)begin
      for(b2=0;b2<2;b2=b2+1)begin
        for(b3=0;b3<2;b3=b3+1)begin
          for(b4=0;b4<2;b4=b4+1)begin
          a[1]=b1;
          a[0]=b2;
          b[1]=b3;
          b[0]=b4;
          #10;
        end
      end
    end
  end
  $finish;
  end
endmodule