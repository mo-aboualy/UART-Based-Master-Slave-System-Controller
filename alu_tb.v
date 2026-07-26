`timescale 1us / 1us
module alu_tb();
reg [15:0] a_tb,b_tb;
reg [3:0] alu_fun_tb;
reg clk_tb;
wire [15:0] alu_out_tb;
wire carry_flag_tb,arith_flag_tb,logic_flag_tb;
wire cmp_flag_tb,shift_flag_tb;
alu DUT (
.a(a_tb),
.b(b_tb),
.alu_fun(alu_fun_tb),
.clk(clk_tb),
.alu_out(alu_out_tb),
.carry_flag(carry_flag_tb),
.arith_flag(arith_flag_tb),
.logic_flag(logic_flag_tb),
.cmp_flag(cmp_flag_tb),
.shift_flag(shift_flag_tb)
);
initial
begin
$dumpfile("alu_tb.vcd");
$dumpvars;
$monitor("time=%0t alu_fun=%4b alu_out=%0d carry=%0b arith=%0b logic=%0b cmp=%0b shift=%0b",
              $time, alu_fun_tb, alu_out_tb, carry_flag_tb, arith_flag_tb, logic_flag_tb, cmp_flag_tb, shift_flag_tb);
 clk_tb = 0;
 a_tb = 0; b_tb = 0; alu_fun_tb = 0;
    #2  a_tb=16'd65535; b_tb=16'd2; alu_fun_tb=4'b0000;  // ADD With Carry
    #10 a_tb=16'd27; b_tb=16'd12; alu_fun_tb=4'b0000;  // ADD
    #10 a_tb=16'd10; b_tb=16'd15; alu_fun_tb=4'b0001;  // SUB With Borrow
    #10 a_tb=16'd15; b_tb=16'd8; alu_fun_tb=4'b0001;  // SUB
    #10 a_tb=16'd5;  b_tb=16'd3;  alu_fun_tb=4'b0010;  // MUL
    #10 a_tb=16'd20; b_tb=16'd4;  alu_fun_tb=4'b0011;  // DIV
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0100; // AND
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0101; // OR
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0110; // NAND
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b0111; // NOR
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b1000; // XOR
    #10 a_tb=16'hFF00; b_tb=16'h0FF0; alu_fun_tb=4'b1001; // XNOR
    #10 a_tb=16'd7;  b_tb=16'd7;  alu_fun_tb=4'b1010;  // CMP EQ
    #10 a_tb=16'd10; b_tb=16'd3;  alu_fun_tb=4'b1011;  // CMP GT
    #10 a_tb=16'd3;  b_tb=16'd10; alu_fun_tb=4'b1100;  // CMP LT
    #10 a_tb=16'd8;  b_tb=16'd0;  alu_fun_tb=4'b1101;  // SHIFT A>>1
    #10 a_tb=16'd8;  b_tb=16'd0;  alu_fun_tb=4'b1110;  // SHIFT A<<1
    #10 a_tb=16'd0;  b_tb=16'd0;  alu_fun_tb=4'b1111;  // NOP (invalid code -> 0)

    #10 $finish;
end
always #5 clk_tb=~clk_tb;
endmodule
