module enc_8x3_tb;
  reg [7:0] i;
  reg en;
  wire [2:0] o;
  
  enc_8x3 uut(.i(i),.en(en),.o(o));
  
  initial begin
    $dumpfile("enc_8x3.vcd");
  	$dumpvars;
  end
  
  initial begin
    $display("encoder test");
    for(int j=0;j<8;j++) begin
      i=8'b00000000;
      for(int k=0;k<2;k++)begin
        en=k;
        i[j]=1'b1;
        #1;
        $display("Input: %b, Output: %b at en:%b",i,o,en);
      	#10;
      end
    end
    $finish;
  end
endmodule