module tb_unv_4bit;
  reg [3:0] in_l;
  reg in_clk, in_rst, in_sir, in_sil;
  reg [1:0] in_m;
  wire [3:0] o_q;

  unv_4bit dut (
    .in_l(in_l),
    .in_clk(in_clk),
    .in_rst(in_rst),
    .in_sir(in_sir),
    .in_sil(in_sil),
    .in_m(in_m),
    .o_q(o_q)
  );

  initial begin
    in_clk = 1;
    in_rst = 1;
    in_m = 2'b00;
    in_l = 4'b0000;
    in_sir = 0;
    in_sil = 0;
    clk();           // Apply reset
    in_rst = 0;

    // Step 1: Parallel load 4'b0101
    in_l = 4'b0101;
    in_m = 2'b11;
    clk();           // o_q = 0101

    // Step 2: Shift right (MSB = in_sir = 1)
    in_m = 2'b01;
    in_sir = 1;
    clk();           // o_q = 1010

    // Step 3: Hold
    in_m = 2'b00;
    clk();           // o_q = 1010

    // Step 4: Shift left (LSB = in_sil = 0)
    in_m = 2'b10;
    in_sil = 0;
    clk();           // o_q = 0100
    clk();

    $finish;
  end

  task clk;
    begin
      #5 in_clk = 0;
      #5 in_clk = 1;
    end
  endtask
endmodule
