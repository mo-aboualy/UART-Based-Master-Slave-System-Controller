`timescale 1ns / 1ps

module alu_signed_tb;

    // Parameters
    parameter WIDTH     = 8;
    parameter CMP_WIDTH = 2;
    parameter CLK_PER   = 10;

    // Testbench Signals
    reg  [WIDTH-1:0]     a;
    reg  [WIDTH-1:0]     b;
    reg  [3:0]           alu_fun;
    reg                  clk;
    reg                  rst;

    wire [2*WIDTH-1:0]   ALU_OUT;
    wire                 ALU_Valid;

    // Instantiate Device Under Test (DUT)
    alu_top #(
        .width(WIDTH),
        .cmp_width(CMP_WIDTH)
    ) uut (
        .a(a),
        .b(b),
        .alu_fun(alu_fun),
        .clk(clk),
        .rst(rst),
        .ALU_OUT(ALU_OUT),
        .ALU_Valid(ALU_Valid)
    );

    // Clock Generator (100 MHz)
    always #(CLK_PER / 2) clk = ~clk;

    // Test Stimulus
    initial begin
        // Initialize Signals
        clk     = 0;
        rst     = 0;
        a       = 0;
        b       = 0;
        alu_fun = 0;

        // Apply Reset
        #(CLK_PER * 2);
        rst = 1;
        #(CLK_PER);

        // --- 1. Arithmetic Unit Tests (alu_fun[3:2] = 2'b00) ---
        $display("=== Testing Arithmetic Unit ===");
        a = 8'd25; b = 8'd5;

        alu_fun = 4'b0000; #(CLK_PER); // ADD
        $display("[ADD]  %0d + %0d = %0d | Valid = %b", a, b, ALU_OUT, ALU_Valid);

        alu_fun = 4'b0001; #(CLK_PER); // SUB
        $display("[SUB]  %0d - %0d = %0d | Valid = %b", a, b, ALU_OUT, ALU_Valid);

        alu_fun = 4'b0010; #(CLK_PER); // MUL
        $display("[MUL]  %0d * %0d = %0d | Valid = %b", a, b, ALU_OUT, ALU_Valid);

        alu_fun = 4'b0011; #(CLK_PER); // DIV
        $display("[DIV]  %0d / %0d = %0d | Valid = %b", a, b, ALU_OUT, ALU_Valid);

        // --- 2. Logic Unit Tests (alu_fun[3:2] = 2'b01) ---
        $display("\n=== Testing Logic Unit ===");
        a = 8'b1010_1100; b = 8'b1100_0011;

        alu_fun = 4'b0100; #(CLK_PER); // AND
        $display("[AND]  %b & %b = %b | Valid = %b", a, b, ALU_OUT[WIDTH-1:0], ALU_Valid);

        alu_fun = 4'b0101; #(CLK_PER); // OR
        $display("[OR]   %b | %b = %b | Valid = %b", a, b, ALU_OUT[WIDTH-1:0], ALU_Valid);

        alu_fun = 4'b0110; #(CLK_PER); // NAND
        $display("[NAND] ~(%b & %b) = %b | Valid = %b", a, b, ALU_OUT[WIDTH-1:0], ALU_Valid);

        alu_fun = 4'b0111; #(CLK_PER); // NOR
        $display("[NOR]  ~(%b | %b) = %b | Valid = %b", a, b, ALU_OUT[WIDTH-1:0], ALU_Valid);

        // --- 3. Compare Unit Tests (alu_fun[3:2] = 2'b10) ---
        $display("\n=== Testing Compare Unit ===");
        a = 8'd15; b = 8'd10;

        alu_fun = 4'b1001; #(CLK_PER); // EQUAL
        $display("[CMP]  (%0d == %0d) -> Result = %0d | Valid = %b", a, b, ALU_OUT[CMP_WIDTH-1:0], ALU_Valid);

        alu_fun = 4'b1010; #(CLK_PER); // GREATER
        $display("[CMP]  (%0d >  %0d) -> Result = %0d | Valid = %b", a, b, ALU_OUT[CMP_WIDTH-1:0], ALU_Valid);

        alu_fun = 4'b1011; #(CLK_PER); // LESS
        $display("[CMP]  (%0d <  %0d) -> Result = %0d | Valid = %b", a, b, ALU_OUT[CMP_WIDTH-1:0], ALU_Valid);

        // --- 4. Shift Unit Tests (alu_fun[3:2] = 2'b11) ---
        $display("\n=== Testing Shift Unit ===");
        a = 8'b0001_0100; b = 8'b0010_1000;

        alu_fun = 4'b1100; #(CLK_PER); // A >> 1
        $display("[SHIFT] A >> 1: %b >> 1 = %b | Valid = %b", a, ALU_OUT[WIDTH:0], ALU_Valid);

        alu_fun = 4'b1101; #(CLK_PER); // A << 1
        $display("[SHIFT] A << 1: %b << 1 = %b | Valid = %b", a, ALU_OUT[WIDTH:0], ALU_Valid);

        alu_fun = 4'b1110; #(CLK_PER); // B >> 1
        $display("[SHIFT] B >> 1: %b >> 1 = %b | Valid = %b", b, ALU_OUT[WIDTH:0], ALU_Valid);

        alu_fun = 4'b1111; #(CLK_PER); // B << 1
        $display("[SHIFT] B << 1: %b << 1 = %b | Valid = %b", b, ALU_OUT[WIDTH:0], ALU_Valid);

        #(CLK_PER * 2);
        $finish;
    end

endmodule