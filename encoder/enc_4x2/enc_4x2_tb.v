module enc_4x2_tb;
  reg [3:0] i;
  reg en;
  wire [1:0] o;
  
  enc_4x2 uut(.i(i),.en(en),.o(o));
  
  initial begin
    $dumpfile("enc_4x2.vcd");
  	$dumpvars;
  end
  
  initial begin
    $display("encoder test");
    for(int j=0;j<4;j++) begin
      i=4'b0000;
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