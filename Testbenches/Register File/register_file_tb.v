`timescale 1ns/1ps

module register_file_tb;

    // ------------------------------------------------------------
    // Parameters (must match the DUT overrides below)
    // ------------------------------------------------------------
    parameter WIDTH      = 8;
    parameter ADDR_WIDTH = 4;
    parameter DEPTH      = 2*ADDR_WIDTH;
    parameter CLK_PERIOD = 10;

    localparam [WIDTH-1:0] REG2_rst_tb = 8'b1000_0001;  // UART config default
    localparam [WIDTH-1:0] REG3_rst_tb = 8'b0010_0000;  // Clock divider default

    // ------------------------------------------------------------
    // Signals 
    // ------------------------------------------------------------
    reg                  clk_tb;
    reg                  rst_tb;
    reg  [ADDR_WIDTH-1:0] address_tb;
    reg                  WR_en_tb;
    reg                  RD_en_tb;
    reg  [WIDTH-1:0]     WR_Data_tb;
    wire [WIDTH-1:0]     RD_Data_tb;
    wire                 RD_Valid_tb;
    wire [WIDTH-1:0]     REG0_tb;
    wire [WIDTH-1:0]     REG1_tb;
    wire [WIDTH-1:0]     REG2_tb;
    wire [WIDTH-1:0]     REG3_tb;

    // Reference model
    reg  [WIDTH-1:0]     model_mem_tb [0:DEPTH-1];

    integer errors_tb;
    integer checks_tb;
    integer i_tb;
    integer op_tb;

    // ------------------------------------------------------------
    // DUT (widths below must match the module defaults: 8-bit data, 4-bit address)
    // ------------------------------------------------------------
    register_file DUT (
        .clk      (clk_tb),
        .rst      (rst_tb),
        .address  (address_tb),
        .WR_en    (WR_en_tb),
        .RD_en    (RD_en_tb),
        .WR_Data  (WR_Data_tb),
        .RD_Data  (RD_Data_tb),
        .RD_Valid (RD_Valid_tb),
        .REG0     (REG0_tb),
        .REG1     (REG1_tb),
        .REG2     (REG2_tb),
        .REG3     (REG3_tb)
    );

    // ------------------------------------------------------------
    // Clock
    // ------------------------------------------------------------
    initial clk_tb = 1'b0;
    always #(CLK_PERIOD/2) clk_tb = ~clk_tb;

    // ------------------------------------------------------------
    // Helper tasks
    // Convention: every task starts and ends aligned to a negedge,
    // so inputs change away from the sampling (posedge) edge.
    // ------------------------------------------------------------
    task check;
        input [WIDTH-1:0]  got;
        input [WIDTH-1:0]  expected;
        input [8*24-1:0]   name;
        begin
            checks_tb = checks_tb + 1;
            if (got !== expected) begin
                errors_tb = errors_tb + 1;
                $display("[FAIL] t=%0t %0s: got=0x%h expected=0x%h",
                         $time, name, got, expected);
            end
        end
    endtask

    task model_reset;
        integer k;
        begin
            for (k = 0; k < DEPTH; k = k + 1)
                model_mem_tb[k] = {WIDTH{1'b0}};
            model_mem_tb[2] = REG2_rst_tb;
            model_mem_tb[3] = REG3_rst_tb;
        end
    endtask

    task check_regs;
        begin
            check(REG0_tb, model_mem_tb[0], "REG0");
            check(REG1_tb, model_mem_tb[1], "REG1");
            check(REG2_tb, model_mem_tb[2], "REG2");
            check(REG3_tb, model_mem_tb[3], "REG3");
        end
    endtask

    task write_reg;
        input [ADDR_WIDTH-1:0] addr;
        input [WIDTH-1:0]      data;
        begin
            address_tb = addr;
            WR_Data_tb  = data;
            WR_en_tb    = 1'b1;
            RD_en_tb    = 1'b0;
            @(negedge clk_tb);              // posedge captured the write
            WR_en_tb    = 1'b0;
            model_mem_tb[addr] = data;
            check(RD_Valid_tb, 1'b0, "RD_Valid after write");
            check_regs;
        end
    endtask

    task read_reg;
        input [ADDR_WIDTH-1:0] addr;
        begin
            address_tb = addr;
            WR_en_tb    = 1'b0;
            RD_en_tb    = 1'b1;
            @(negedge clk_tb);              // posedge captured the read
            RD_en_tb    = 1'b0;
            check(RD_Valid_tb, 1'b1,               "RD_Valid");
            check(RD_Data_tb,       model_mem_tb[addr], "RD_Data");
        end
    endtask

    task idle_cycle;
        begin
            WR_en_tb = 1'b0;
            RD_en_tb = 1'b0;
            @(negedge clk_tb);
            check(RD_Valid_tb, 1'b0, "RD_Valid when idle");
        end
    endtask

    // ------------------------------------------------------------
    // Test sequence
    // ------------------------------------------------------------
    initial begin
        errors_tb  = 0;
        checks_tb  = 0;
        rst_tb     = 1'b0;
        address_tb = {ADDR_WIDTH{1'b0}};
        WR_en_tb    = 1'b0;
        RD_en_tb    = 1'b0;
        WR_Data_tb  = {WIDTH{1'b0}};
        model_reset;

        // ---------- Test 1: reset values ----------
        $display("--- Test 1: reset default values ---");
        #1;
        check(RD_Data_tb,       {WIDTH{1'b0}}, "RD_Data in reset");
        check(RD_Valid_tb, 1'b0,          "RD_Valid in reset");
        check_regs;
        repeat (2) @(negedge clk_tb);
        rst_tb = 1'b1;
        @(negedge clk_tb);
        check_regs;

        // Read back every reset default through the read port
        for (i_tb = 0; i_tb < DEPTH; i_tb = i_tb + 1)
            read_reg(i_tb[ADDR_WIDTH-1:0]);
        idle_cycle;

        // ---------- Test 2: write then read every address ----------
        $display("--- Test 2: write/read all addresses ---");
        for (i_tb = 0; i_tb < DEPTH; i_tb = i_tb + 1)
            write_reg(i_tb[ADDR_WIDTH-1:0], (i_tb * 17 + 8'hA5));
        for (i_tb = 0; i_tb < DEPTH; i_tb = i_tb + 1)
            read_reg(i_tb[ADDR_WIDTH-1:0]);
        idle_cycle;

        // ---------- Test 3: RD_Valid is a one-cycle pulse per read ----------
        $display("--- Test 3: RD_Valid pulse ---");
        read_reg(4'h2);
        idle_cycle;                         // RD_Valid must drop
        idle_cycle;

        // ---------- Test 4: back-to-back reads ----------
        $display("--- Test 4: back-to-back reads ---");
        read_reg(4'h1);
        read_reg(4'h5);
        read_reg(4'hF);
        idle_cycle;

        // ---------- Test 5: WR_en and RD_en together -> ignored ----------
        $display("--- Test 5: simultaneous WR_en & RD_en ---");
        address_tb = 4'h5;
        WR_Data_tb  = 8'hFF;
        WR_en_tb    = 1'b1;
        RD_en_tb    = 1'b1;
        @(negedge clk_tb);
        WR_en_tb    = 1'b0;
        RD_en_tb    = 1'b0;
        check(RD_Valid_tb, 1'b0, "RD_Valid on conflict");
        read_reg(4'h5);                     // content must be unchanged
        idle_cycle;

        // ---------- Test 6: write to REG0..REG3 drives outputs ----------
        $display("--- Test 6: REG0..REG3 output ports ---");
        write_reg(4'h0, 8'h12);
        write_reg(4'h1, 8'h34);
        write_reg(4'h2, 8'h56);
        write_reg(4'h3, 8'h78);
        check_regs;

        // ---------- Test 7: asynchronous reset in mid-operation ----------
        $display("--- Test 7: async reset ---");
        write_reg(4'h7, 8'hC3);
        read_reg(4'h7);
        #(CLK_PERIOD/4);                    // not on a clock edge
        rst_tb = 1'b0;
        model_reset;
        #1;
        check(RD_Data_tb,       {WIDTH{1'b0}}, "RD_Data after async rst");
        check(RD_Valid_tb, 1'b0,          "RD_Valid after async rst");
        check_regs;
        @(negedge clk_tb);
        rst_tb = 1'b1;
        @(negedge clk_tb);
        read_reg(4'h7);                     // must be back to 0
        idle_cycle;

        // ---------- Test 8: constrained random ----------
        $display("--- Test 8: random traffic ---");
        for (i_tb = 0; i_tb < 500; i_tb = i_tb + 1) begin
            op_tb = $urandom_range(0, 2);
            case (op_tb)
                0: write_reg($urandom_range(0, DEPTH-1), $urandom);
                1: read_reg ($urandom_range(0, DEPTH-1));
                2: idle_cycle;
            endcase
        end

        // ---------- Summary ----------
        $display("=====================================");
        $display(" Checks: %0d   Errors: %0d", checks_tb, errors_tb);
        if (errors_tb == 0) $display(" RESULT: PASS");
        else                $display(" RESULT: FAIL");
        $display("=====================================");
        $finish;
    end

    // Watchdog
    initial begin
        #(CLK_PERIOD * 20000);
        $display("[TIMEOUT] simulation did not finish");
        $finish;
    end

    // Optional waveform dump
    initial begin
        $dumpfile("register_file_tb.vcd");
        $dumpvars(0, register_file_tb);
    end

endmodule