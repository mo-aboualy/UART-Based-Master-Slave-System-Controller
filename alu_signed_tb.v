`timescale 1us / 1us
module alu_signed_tb();
reg signed [15:0] a_tb,b_tb;
reg [3:0] alu_fun_tb;
reg clk_tb,rst_tb;
wire signed [31:0] arith_out_tb;
wire arith_flag_tb;
wire [15:0] logic_out_tb;
wire logic_flag_tb;
wire [1:0] cmp_out_tb;
wire cmp_flag_tb;
wire [16:0] shift_out_tb;
wire shift_flag_tb;
alu_top DUT (
.a(a_tb),
.b(b_tb),
.alu_fun(alu_fun_tb),
.clk(clk_tb),
.rst(rst_tb),
.arith_out(arith_out_tb),
.arith_flag(arith_flag_tb),
.logic_out(logic_out_tb),
.logic_flag(logic_flag_tb),
.cmp_out(cmp_out_tb),
.cmp_flag(cmp_flag_tb),
.shift_out(shift_out_tb),
.shift_flag(shift_flag_tb)
);
initial
begin
$dumpfile("alu_signed_tb.vcd");
$dumpvars;

$display("%8s | %4s | %8s | %8s | %11s | %2s | %10s | %2s | %7s | %2s | %10s | %2s |",
              "TIME(us)","FUN","a","b","ARITH_OUT","AF","LOGIC_OUT","LF","CMP_OUT","CF","SHIFT_OUT","SF");
$monitor(" %8d | %4b | %8d | %8d | %11d | %2b | 0x%8h | %2b | %7d | %2b | %10d | %2b |",
              $time, alu_fun_tb, a_tb, b_tb, arith_out_tb, arith_flag_tb, logic_out_tb, logic_flag_tb, cmp_out_tb, cmp_flag_tb, shift_out_tb, shift_flag_tb);

 clk_tb = 0;
 rst_tb = 0;
 a_tb = 0; b_tb = 0; alu_fun_tb = 0;
 #3  rst_tb=1; // release async reset
    // ---- Signed Arithmetic : Addition ----
    #10 a_tb=-4;  b_tb=-10; alu_fun_tb=4'b0000; // ADD  Neg + Neg
    #10 a_tb=8;   b_tb=-3;  alu_fun_tb=4'b0000; // ADD  Pos + Neg
    #10 a_tb=-8;  b_tb=3;   alu_fun_tb=4'b0000; // ADD  Neg + Pos
    #10 a_tb=8;   b_tb=3;   alu_fun_tb=4'b0000; // ADD  Pos + Pos
    // ---- Signed Arithmetic : Subtraction ----
    #10 a_tb=-4;  b_tb=-10; alu_fun_tb=4'b0001; // SUB  Neg - Neg
    #10 a_tb=8;   b_tb=-3;  alu_fun_tb=4'b0001; // SUB  Pos - Neg
    #10 a_tb=-8;  b_tb=3;   alu_fun_tb=4'b0001; // SUB  Neg - Pos
    #10 a_tb=8;   b_tb=3;   alu_fun_tb=4'b0001; // SUB  Pos - Pos
    // ---- Signed Arithmetic : Multiplication ----
    #10 a_tb=-4;  b_tb=-3;  alu_fun_tb=4'b0010; // MUL  Neg * Neg
    #10 a_tb=4;   b_tb=-3;  alu_fun_tb=4'b0010; // MUL  Pos * Neg
    #10 a_tb=-4;  b_tb=3;   alu_fun_tb=4'b0010; // MUL  Neg * Pos
    #10 a_tb=4;   b_tb=3;   alu_fun_tb=4'b0010; // MUL  Pos * Pos
    // ---- Signed Arithmetic : Division ----
    #10 a_tb=-12; b_tb=-3;  alu_fun_tb=4'b0011; // DIV  Neg / Neg
    #10 a_tb=12;  b_tb=-3;  alu_fun_tb=4'b0011; // DIV  Pos / Neg
    #10 a_tb=-12; b_tb=3;   alu_fun_tb=4'b0011; // DIV  Neg / Pos
    #10 a_tb=12;  b_tb=3;   alu_fun_tb=4'b0011; // DIV  Pos / Pos
    // ---- Logic Operations ----
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0100; // AND
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0101; // OR
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0110; // NAND
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0111; // NOR
    // ---- NOP ----
    #10 a_tb=0;   b_tb=0;   alu_fun_tb=4'b1000; // NOP
    // ---- Comparison Operations ----
    #10 a_tb=7;   b_tb=7;   alu_fun_tb=4'b1001; // CMP  A = B
    #10 a_tb=10;  b_tb=3;   alu_fun_tb=4'b1010; // CMP  A > B
    #10 a_tb=3;   b_tb=10;  alu_fun_tb=4'b1011; // CMP  A < B
    // ---- Shift Operations ----
    #10 a_tb=8;   b_tb=8;   alu_fun_tb=4'b1100; // SHIFT A >> 1
    #10 a_tb=8;   b_tb=8;   alu_fun_tb=4'b1101; // SHIFT A << 1
    #10 a_tb=8;   b_tb=8;   alu_fun_tb=4'b1110; // SHIFT B >> 1
    #10 a_tb=8;   b_tb=8;   alu_fun_tb=4'b1111; // SHIFT B << 1
    #10 $finish;
end
always begin
    clk_tb=0; #4;
    clk_tb=1; #6;
end
endmodule