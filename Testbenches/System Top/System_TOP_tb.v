`timescale 1ns/1ps

module System_TOP_tb;

    // ------------------------------------------------------------------
    // Clocks
    // ------------------------------------------------------------------
    localparam real REF_HALF  = 10.0;        // 50 MHz
    localparam real UART_HALF = 135.63368;   // 3.6864 MHz

    // ------------------------------------------------------------------
    // Configuration written to REG2 / REG3 at start-up
    // ------------------------------------------------------------------
    localparam [5:0] CFG_PRESCALE = 6'd32;
    localparam       CFG_PAR_TYPE = 1'b0;    // 0: even, 1: odd
    localparam       CFG_PAR_EN   = 1'b1;
    localparam [7:0] CFG_REG2     = {CFG_PRESCALE, CFG_PAR_TYPE, CFG_PAR_EN};
    localparam [7:0] CFG_REG3     = 8'd32;   // TX clock division ratio

    localparam real  TX_BIT = 2.0 * UART_HALF * CFG_REG3;

    // ------------------------------------------------------------------
    // Commands, ALU functions and test operands
    // ------------------------------------------------------------------
    localparam [7:0] RF_WR_CMD     = 8'hAA;
    localparam [7:0] RF_RD_CMD     = 8'hBB;
    localparam [7:0] ALU_W_OP_CMD  = 8'hCC;
    localparam [7:0] ALU_W_NOP_CMD = 8'hDD;

    localparam [3:0] ALU_ADD  = 4'b0000, ALU_SUB  = 4'b0001,
                     ALU_MUL  = 4'b0010, ALU_DIV  = 4'b0011,
                     ALU_AND  = 4'b0100, ALU_OR   = 4'b0101,
                     ALU_NAND = 4'b0110, ALU_NOR  = 4'b0111;

    localparam [7:0] OPERAND_A = 8'd100;
    localparam [7:0] OPERAND_B = 8'd10;

    // System_Controller states
    localparam [3:0] S_IDLE         = 4'd0,  S_WR_ADDR      = 4'd1,
                     S_WR_DATA      = 4'd2,  S_RD_ADDR      = 4'd3,
                     S_RD_WAIT      = 4'd4,  S_OP_A         = 4'd5,
                     S_OP_B         = 4'd6,  S_ALU_FUNC_OP  = 4'd7,
                     S_ALU_FUNC_NOP = 4'd8,  S_ALU_WAIT     = 4'd9,
                     S_ALU_OUT_L    = 4'd10, S_ALU_OUT_H    = 4'd11;

    // ------------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------------
    reg  REF_CLK  = 1'b0;
    reg  UART_CLK = 1'b0;
    reg  RST;
    reg  RX_IN    = 1'b1;
    wire TX_OUT;
    wire PAR_err;
    wire STOP_err;

    System_TOP DUT (
        .REF_CLK  (REF_CLK),
        .UART_CLK (UART_CLK),
        .RST      (RST),
        .RX_IN    (RX_IN),
        .TX_OUT   (TX_OUT),
        .PAR_err  (PAR_err),
        .STOP_err (STOP_err)
    );

    always #(REF_HALF)  REF_CLK  = ~REF_CLK;
    always #(UART_HALF) UART_CLK = ~UART_CLK;

    // ------------------------------------------------------------------
    // Testbench state
    // ------------------------------------------------------------------
    integer checks        = 0;
    integer errors        = 0;
    integer rx_flag_errs  = 0;   // PAR_err / STOP_err assertions
    integer tx_frame_errs = 0;   // bad parity / stop bit on TX_OUT

    reg par_en   = 1'b1;         // frame format: reset default until REG2 is written
    reg par_type = 1'b0;

    reg [7:0] tx_mem [0:15];     // bytes received on TX_OUT
    integer   tx_count   = 0;
    integer   tx_checked = 0;
    reg [7:0] tx_byte;
    reg       tx_ok;

    // ------------------------------------------------------------------
    // Reporting helpers
    // ------------------------------------------------------------------
    function [4*8-1:0] verdict;
        input ok;
        begin
            verdict = ok ? "PASS" : "FAIL";
        end
    endfunction

    task tally;
        input ok;
        begin
            checks = checks + 1;
            if (!ok) errors = errors + 1;
        end
    endtask

    task section;
        input [8*40-1:0] title;
        begin
            $display("\n[ %0s ]", title);
        end
    endtask

    function [12*8-1:0] state_name;
        input [3:0] s;
        begin
            case (s)
                S_IDLE:         state_name = "IDLE";
                S_WR_ADDR:      state_name = "WR_ADDR";
                S_WR_DATA:      state_name = "WR_DATA";
                S_RD_ADDR:      state_name = "RD_ADDR";
                S_RD_WAIT:      state_name = "RD_WAIT";
                S_OP_A:         state_name = "OP_A";
                S_OP_B:         state_name = "OP_B";
                S_ALU_FUNC_OP:  state_name = "ALU_FUNC_OP";
                S_ALU_FUNC_NOP: state_name = "ALU_FUNC_NOP";
                S_ALU_WAIT:     state_name = "ALU_WAIT";
                S_ALU_OUT_L:    state_name = "ALU_OUT_L";
                S_ALU_OUT_H:    state_name = "ALU_OUT_H";
                default:        state_name = "UNKNOWN";
            endcase
        end
    endfunction

    function [4*8-1:0] alu_name;
        input [3:0] f;
        begin
            case (f)
                ALU_ADD:  alu_name = "ADD ";
                ALU_SUB:  alu_name = "SUB ";
                ALU_MUL:  alu_name = "MUL ";
                ALU_DIV:  alu_name = "DIV ";
                ALU_AND:  alu_name = "AND ";
                ALU_OR:   alu_name = "OR  ";
                ALU_NAND: alu_name = "NAND";
                ALU_NOR:  alu_name = "NOR ";
                default:  alu_name = "???";
            endcase
        end
    endfunction

    // ------------------------------------------------------------------
    // RX side: send one UART frame (bits change on the falling clock edge)
    // ------------------------------------------------------------------
    task send_bit;
        input value;
        begin
            RX_IN = value;
            repeat (CFG_PRESCALE) @(negedge UART_CLK);
        end
    endtask

    task send_frame;
        input [7:0] data;
        integer i;
        begin
            @(negedge UART_CLK);
            send_bit(1'b0);                                   // start
            for (i = 0; i < 8; i = i + 1)
                send_bit(data[i]);                            // data, LSB first
            if (par_en)
                send_bit((^data) ^ par_type);                 // parity
            send_bit(1'b1);                                   // stop
            repeat (2) send_bit(1'b1);                        // idle gap
        end
    endtask

    // Wait for System_Controller (REF_CLK domain) to reach a state
    task wait_state;
        input [3:0] expected;
        integer cycles;
        begin
            cycles = 0;
            while (DUT.SYS_CTRL.current_state !== expected && cycles < 500) begin
                @(posedge REF_CLK);
                cycles = cycles + 1;
            end
            if (DUT.SYS_CTRL.current_state !== expected) begin
                tally(1'b0);
                $display("[%t] FAIL  controller stuck in %0s, expected %0s",
                         $time, state_name(DUT.SYS_CTRL.current_state), state_name(expected));
            end
        end
    endtask

    // A frame reaches the controller through UART_RX + Data_Sync, so wait for the next state
    task send_and_wait;
        input [7:0] data;
        input [3:0] next_state;
        begin
            send_frame(data);
            wait_state(next_state);
        end
    endtask

    // ------------------------------------------------------------------
    // Checkers
    // ------------------------------------------------------------------
    task check_reg;
        input [3:0]      addr;
        input [7:0]      expected;
        input [8*24-1:0] name;
        reg ok;
        begin
            ok = (DUT.Register_File.reg_file[addr] === expected);
            tally(ok);
            $display("[%t] %0s  %0s  REG[0x%0h] = 0x%02h", $time, verdict(ok), name, addr, expected);
            if (!ok)
                $display("                   got 0x%02h", DUT.Register_File.reg_file[addr]);
        end
    endtask

    // Next byte received on TX_OUT (tx_ok = 0 on timeout)
    task read_tx;
        integer waited;
        begin
            waited = 0;
            while (tx_count <= tx_checked && waited < 80) begin
                #(TX_BIT);
                waited = waited + 1;
            end
            tx_ok = (tx_count > tx_checked);
            if (tx_ok) begin
                tx_byte    = tx_mem[tx_checked];
                tx_checked = tx_checked + 1;
            end
        end
    endtask

    task check_alu_result;
        input [3:0]  fun;
        input [15:0] expected;
        reg [15:0] got;
        reg        ok;
        begin
            read_tx;
            got[7:0] = tx_byte;
            ok = tx_ok;
            read_tx;
            got[15:8] = tx_byte;
            ok = ok && tx_ok && (got === expected);
            tally(ok);
            $display("[%t] %0s  ALU %0s      A=%0d B=%0d -> 0x%04h", $time, verdict(ok),
                     alu_name(fun), DUT.OP_A, DUT.OP_B, expected);
            if (!ok)
                $display("                   got 0x%04h", got);
        end
    endtask

    // ------------------------------------------------------------------
    // The four commands
    // ------------------------------------------------------------------
    // Register File write : 0xAA, address, data
    task rf_write;
        input [7:0]      addr;
        input [7:0]      data;
        input [8*24-1:0] name;
        begin
            send_and_wait(RF_WR_CMD, S_WR_ADDR);
            send_and_wait(addr,      S_WR_DATA);
            send_and_wait(data,      S_IDLE);
            check_reg(addr[3:0], data, name);
        end
    endtask

    // Register File read : 0xBB, address -> one byte back on TX_OUT
    task rf_read;
        input [7:0] addr;
        input [7:0] expected;
        reg ok;
        begin
            send_and_wait(RF_RD_CMD, S_RD_ADDR);
            send_and_wait(addr,      S_IDLE);
            read_tx;
            ok = tx_ok && (tx_byte === expected);
            tally(ok);
            $display("[%t] %0s  RF read      REG[0x%0h] = 0x%02h", $time, verdict(ok), addr[3:0], expected);
            if (!ok)
                $display("                   got 0x%02h", tx_ok ? tx_byte : 8'hxx);
        end
    endtask

    // ALU operation with operands : 0xCC, A, B, FUN -> two bytes back (LSB first)
    task alu_with_operands;
        input [7:0]  a;
        input [7:0]  b;
        input [3:0]  fun;
        input [15:0] expected;
        begin
            send_and_wait(ALU_W_OP_CMD, S_OP_A);
            send_and_wait(a,            S_OP_B);
            check_reg(4'h0, a, "OP_A stored");
            send_and_wait(b,            S_ALU_FUNC_OP);
            check_reg(4'h1, b, "OP_B stored");
            send_and_wait({4'b0, fun},  S_IDLE);
            check_alu_result(fun, expected);
        end
    endtask

    // ALU operation without operands : 0xDD, FUN -> uses REG0 / REG1 as they are
    task alu_no_operands;
        input [3:0]  fun;
        input [15:0] expected;
        begin
            send_and_wait(ALU_W_NOP_CMD, S_ALU_FUNC_NOP);
            send_and_wait({4'b0, fun},   S_IDLE);
            check_alu_result(fun, expected);
        end
    endtask

    // ------------------------------------------------------------------
    // Monitors
    // ------------------------------------------------------------------
    // Every frame sent is legal, so the RX error flags must never rise
    always @(posedge PAR_err or posedge STOP_err)
        if (DUT.RST_Domain_2 === 1'b1) begin
            rx_flag_errs = rx_flag_errs + 1;
            $display("[%t] FAIL  PAR_err=%b STOP_err=%b asserted", $time, PAR_err, STOP_err);
        end

    // TX frame receiver: samples TX_OUT in the middle of every bit
    initial begin : tx_monitor
        integer   i;
        reg [7:0] data;
        reg       parity, stop;

        wait (DUT.RST_Domain_2 === 1'b1);
        wait (TX_OUT === 1'b1);
        forever begin
            @(negedge TX_OUT);
            #(TX_BIT / 2.0);
            for (i = 0; i < 8; i = i + 1) begin
                #(TX_BIT);
                data[i] = TX_OUT;
            end
            if (par_en) begin
                #(TX_BIT);
                parity = TX_OUT;
                if (parity !== ((^data) ^ par_type)) begin
                    tx_frame_errs = tx_frame_errs + 1;
                    $display("[%t] FAIL  TX parity bit wrong", $time);
                end
            end
            #(TX_BIT);
            stop = TX_OUT;
            if (stop !== 1'b1) begin
                tx_frame_errs = tx_frame_errs + 1;
                $display("[%t] FAIL  TX stop bit wrong", $time);
            end
            tx_mem[tx_count] = data;
            tx_count = tx_count + 1;
            #(TX_BIT / 2.0);
        end
    end

    // ------------------------------------------------------------------
    // Test sequence
    // ------------------------------------------------------------------
    initial begin
        $timeformat(-6, 1, " us", 10);
        $display("==================================================");
        $display(" System_TOP testbench");
        $display("==================================================");

        // Reset: released on REF_CLK falling edge, then wait for both reset synchronizers
        RST = 1'b1;
        #1 RST = 1'b0;
        #(10 * UART_HALF);
        @(negedge REF_CLK) RST = 1'b1;
        wait (DUT.RST_Domain_1 === 1'b1 && DUT.RST_Domain_2 === 1'b1);
        repeat (4) @(negedge UART_CLK);

        // Configuration through Register File writes to 0x2 and 0x3
        section("Configuration");
        rf_write(8'h02, CFG_REG2, "UART_Config");
        par_en   = CFG_PAR_EN;     // later frames use the configured format
        par_type = CFG_PAR_TYPE;
        rf_write(8'h03, CFG_REG3, "Div_Ratio  ");

        section("Register File write");
        rf_write(8'h05, 8'hA5, "RF write   ");

        section("Register File read");
        rf_read(8'h05, 8'hA5);

        section("ALU operation with operands");
        alu_with_operands(OPERAND_A, OPERAND_B, ALU_MUL, OPERAND_A * OPERAND_B);

        section("ALU operation without operands");
        alu_no_operands(ALU_OR, OPERAND_A | OPERAND_B);

        section("Frame integrity");
        tally(rx_flag_errs == 0);
        $display("           %0s  RX flags PAR_err / STOP_err stayed low", verdict(rx_flag_errs == 0));
        tally(tx_frame_errs == 0);
        $display("           %0s  TX frames: parity and stop bits correct", verdict(tx_frame_errs == 0));

        $display("\n==================================================");
        $display(" Checks: %0d   Passed: %0d   Failed: %0d", checks, checks - errors, errors);
        if (errors == 0) $display(" ALL TESTS PASSED");
        else             $display(" TEST FAILED");
        $display("==================================================");
        $finish;
    end

    // Watchdog
    initial begin
        #10_000_000;
        $display("FAIL  watchdog expired");
        $finish;
    end

    initial begin
        $dumpfile("System_TOP_tb.vcd");
        $dumpvars(0, System_TOP_tb);
    end

endmodule