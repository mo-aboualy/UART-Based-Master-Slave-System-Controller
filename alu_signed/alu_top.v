module alu_top #(parameter width = 16 , parameter cmp_width = 2) (
    input  [width-1:0]     a, b,
    input  [3:0]           alu_fun,
    input                  clk, rst,

    output [2*width-1:0]   arith_out,
    output                 arith_flag,

    output [width-1:0]     logic_out,
    output                 logic_flag,

    output [cmp_width-1:0] cmp_out,
    output                 cmp_flag,

    output [width:0]       shift_out,
    output                 shift_flag
);

    wire arith_en, logic_en, cmp_en, shift_en;

    decoder u0 (
        .alu_fun  (alu_fun[3:2]),
        .arith_en (arith_en),
        .logic_en (logic_en),
        .cmp_en   (cmp_en),
        .shift_en (shift_en)
    );

    arithmetic_unit #(.width (width)) u1 (
        .a          (a),
        .b          (b),
        .alu_fun    (alu_fun[1:0]),
        .arith_en   (arith_en),
        .clk        (clk),
        .rst        (rst),
        .arith_out  (arith_out),
        .arith_flag (arith_flag)
    );

    logic_unit #(.width (width)) u2 (
        .a          (a),
        .b          (b),
        .alu_fun    (alu_fun[1:0]),
        .logic_en   (logic_en),
        .clk        (clk),
        .rst        (rst),
        .logic_out  (logic_out),
        .logic_flag (logic_flag)
    );

    cmp_unit #(.width (width) , .cmp_width (cmp_width)) u3 (
        .a        (a),
        .b        (b),
        .alu_fun  (alu_fun[1:0]),
        .cmp_en   (cmp_en),
        .clk      (clk),
        .rst      (rst),
        .cmp_out  (cmp_out),
        .cmp_flag (cmp_flag)
    );

    shift_unit #(.width (width)) u4 (
        .a          (a),
        .b          (b),
        .alu_fun    (alu_fun[1:0]),
        .shift_en   (shift_en),
        .clk        (clk),
        .rst        (rst),
        .shift_out  (shift_out),
        .shift_flag (shift_flag)
    );

endmodule