module FA_tb;
  reg a,b,cin;
  wire sum, cout;
  FA uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  
 integer i,j,k;
 initial begin
   $dumpfile("FA.vcd");
   $dumpvars;
 end
 initial begin
   for(i=0;i<2;i=i+1) begin
     for(j=0;j<2;j=j+1) begin
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