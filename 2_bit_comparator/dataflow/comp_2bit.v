module comp_2bit(input wire [1:0] a, b, output wire s1, s2, s3);
    // s1: a > b
    assign s1 = ((~(a[1] ^ b[1])) & a[0] & ~b[0]) | (a[1] & ~b[1]);

    // s2: a == b
    assign s2 = (~(a[1] ^ b[1])) & (~(a[0] ^ b[0]));

    // s3: a < b
    assign s3 = ((~(a[1] ^ b[1])) & ~a[0] & b[0]) | (~a[1] & b[1]);
endmodule
