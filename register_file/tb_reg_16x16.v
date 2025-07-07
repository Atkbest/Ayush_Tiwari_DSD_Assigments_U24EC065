module tb_reg_16x16;
  reg [15:0] in_w_data;
  reg [3:0] in_w_add, in_r_add1, in_r_add2;
  reg in_w_en, in_clk, in_rst;
  wire [15:0] o_r_data1, o_r_data2;

  reg_16x16 dut (
    .in_w_data(in_w_data),
    .in_w_add(in_w_add),
    .in_r_add1(in_r_add1),
    .in_r_add2(in_r_add2),
    .in_w_en(in_w_en),
    .in_clk(in_clk),
    .in_rst(in_rst),
    .o_r_data1(o_r_data1),
    .o_r_data2(o_r_data2)
  );

  // Clock generator
  always #5 in_clk = ~in_clk;

  initial begin
    in_clk = 0;
    in_rst = 1;
    in_w_en = 0;
    #10;
    in_rst = 0;

    // ---- Test 1: Write to address 0 ----
    in_w_data = 16'd240;
    in_w_add = 4'd0;
    in_w_en = 1;
    #10;  // 1 clock cycle

    in_w_en = 0;
    in_r_add1 = 4'd0;
    in_r_add2 = 4'd1;
    #10;  // Wait after write

    $display("Read1 = %d | Read2 = %d", o_r_data1, o_r_data2);

    // ---- Test 2: Write to address 4 ----
    in_w_data = 16'd220;
    in_w_add = 4'd4;
    in_w_en = 1;
    #10;

    in_w_en = 0;
    in_r_add1 = 4'd4;
    in_r_add2 = 4'd0;
    #10;

    $display("Read1 = %d | Read2 = %d", o_r_data1, o_r_data2);

    // Additional tests...
    #20;
    $finish;
  end
endmodule
