`timescale 1ns/1ps

module UART_TX_top_tb;

    // ------------------------------------------------------------
    // Parameters
    // ------------------------------------------------------------
    parameter CLK_PERIOD     = 10;
    parameter RUN_PULSE_TEST = 1;   // 1: also run the single-cycle Data_valid test (Test 9)

    // ------------------------------------------------------------
    // Signals (all suffixed with _tb)
    // ------------------------------------------------------------
    reg        clk_tb;
    reg        rst_tb;
    reg  [7:0] P_data_tb;
    reg        Data_valid_tb;
    reg        PAR_EN_tb;
    reg        PAR_type_tb;
    wire       TX_OUT_tb;
    wire       busy_tb;

    integer errors_tb;
    integer checks_tb;
    integer i_tb;
    reg [7:0] data_rand_tb;
    reg       par_en_rand_tb;
    reg       par_type_rand_tb;

    // ------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------
    UART_TX_top DUT (
        .P_data     (P_data_tb),
        .Data_valid (Data_valid_tb),
        .PAR_EN     (PAR_EN_tb),
        .PAR_type   (PAR_type_tb),
        .clk        (clk_tb),
        .rst        (rst_tb),
        .TX_OUT     (TX_OUT_tb),
        .busy       (busy_tb)
    );

    // ------------------------------------------------------------
    // Clock
    // ------------------------------------------------------------
    initial clk_tb = 1'b0;
    always #(CLK_PERIOD/2) clk_tb = ~clk_tb;

    // ------------------------------------------------------------
    // Helper tasks
    // Convention: every task starts and ends aligned to a negedge.
    // ------------------------------------------------------------
    task check;
        input             got;
        input             expected;
        input [8*24-1:0]  name;
        begin
            checks_tb = checks_tb + 1;
            if (got !== expected) begin
                errors_tb = errors_tb + 1;
                $display("[FAIL] t=%0t %0s: got=%b expected=%b (P_data=0x%h PAR_EN=%b PAR_type=%b)",
                         $time, name, got, expected, P_data_tb, PAR_EN_tb, PAR_type_tb);
            end
        end
    endtask

    // Sends one frame and checks every bit on TX_OUT.
    //   hold = number of clock edges Data_valid stays high (1 or 2)
    // Frame on TX_OUT: start(0), d0..d7 (LSB first), [parity], stop(1), then idle
    task send_frame;
        input [7:0]  data;
        input        par_en;
        input        par_type;
        input [31:0] hold;
        integer      k;
        reg          exp_par;
        begin
            exp_par       = (^data) ^ par_type;   // 0: even, 1: odd

            P_data_tb     = data;
            PAR_EN_tb     = par_en;
            PAR_type_tb   = par_type;
            Data_valid_tb = 1'b1;

            @(negedge clk_tb);                       // start bit
            if (hold < 2) Data_valid_tb = 1'b0;
            check(TX_OUT_tb, 1'b0, "start bit");
            check(busy_tb,   1'b1, "busy in start");

            for (k = 0; k < 8; k = k + 1) begin
                @(negedge clk_tb);                   // data bit k
                if (k == 0) begin
                    Data_valid_tb = 1'b0;
                    P_data_tb     = ~data;           // input changes mid-frame: DUT must hold its copy
                end
                check(TX_OUT_tb, data[k], "data bit");
                check(busy_tb,   1'b1,    "busy in data");
            end

            if (par_en) begin
                @(negedge clk_tb);                   // parity bit
                check(TX_OUT_tb, exp_par, "parity bit");
                check(busy_tb,   1'b1,    "busy in parity");
            end

            @(negedge clk_tb);                       // stop bit
            check(TX_OUT_tb, 1'b1, "stop bit");
            check(busy_tb,   1'b1, "busy in stop");

            @(negedge clk_tb);                       // back to idle
            check(TX_OUT_tb, 1'b1, "idle TX_OUT");
            check(busy_tb,   1'b0, "idle busy");
        end
    endtask

    task idle_cycles;
        input [31:0] n;
        integer k;
        begin
            for (k = 0; k < n; k = k + 1) begin
                @(negedge clk_tb);
                check(TX_OUT_tb, 1'b1, "idle TX_OUT");
                check(busy_tb,   1'b0, "idle busy");
            end
        end
    endtask

    // ------------------------------------------------------------
    // Test sequence
    // ------------------------------------------------------------
    initial begin
        errors_tb     = 0;
        checks_tb     = 0;
        rst_tb        = 1'b0;
        P_data_tb     = 8'h00;
        Data_valid_tb = 1'b0;
        PAR_EN_tb     = 1'b0;
        PAR_type_tb   = 1'b0;

        // ---------- Test 1: reset state ----------
        $display("--- Test 1: reset state ---");
        #1;
        check(TX_OUT_tb, 1'b1, "TX_OUT in reset");
        check(busy_tb,   1'b0, "busy in reset");
        repeat (2) @(negedge clk_tb);
        rst_tb = 1'b1;
        @(negedge clk_tb);

        // ---------- Test 2: idle line ----------
        $display("--- Test 2: idle line stays high ---");
        idle_cycles(5);

        // ---------- Test 3: frame without parity ----------
        $display("--- Test 3: no parity ---");
        send_frame(8'hA5, 1'b0, 1'b0, 2);
        send_frame(8'h3C, 1'b0, 1'b1, 2);        // PAR_type ignored when PAR_EN = 0
        idle_cycles(2);

        // ---------- Test 4: even / odd parity ----------
        $display("--- Test 4: even and odd parity ---");
        send_frame(8'hA5, 1'b1, 1'b0, 2);        // even, ^data = 0
        send_frame(8'hA5, 1'b1, 1'b1, 2);        // odd
        send_frame(8'h07, 1'b1, 1'b0, 2);        // even, ^data = 1
        send_frame(8'h07, 1'b1, 1'b1, 2);        // odd
        idle_cycles(2);

        // ---------- Test 5: corner data patterns ----------
        $display("--- Test 5: corner patterns ---");
        send_frame(8'h00, 1'b1, 1'b0, 2);
        send_frame(8'hFF, 1'b1, 1'b0, 2);
        send_frame(8'h01, 1'b1, 1'b1, 2);
        send_frame(8'h80, 1'b1, 1'b1, 2);
        send_frame(8'h55, 1'b0, 1'b0, 2);
        send_frame(8'hAA, 1'b0, 1'b0, 2);
        idle_cycles(2);

        // ---------- Test 6: back-to-back frames ----------
        $display("--- Test 6: back-to-back frames ---");
        for (i_tb = 0; i_tb < 8; i_tb = i_tb + 1)
            send_frame(8'h11 << (i_tb % 4), i_tb[0], i_tb[1], 2);
        idle_cycles(2);

        // ---------- Test 7: async reset in the middle of a frame ----------
        $display("--- Test 7: async reset mid-frame ---");
        P_data_tb     = 8'h5A;
        PAR_EN_tb     = 1'b1;
        PAR_type_tb   = 1'b0;
        Data_valid_tb = 1'b1;
        @(negedge clk_tb);
        Data_valid_tb = 1'b0;
        repeat (3) @(negedge clk_tb);            // now in the data bits
        #(CLK_PERIOD/4);                         // off the clock edge
        rst_tb = 1'b0;
        #1;
        check(TX_OUT_tb, 1'b1, "TX_OUT after async rst");
        check(busy_tb,   1'b0, "busy after async rst");
        @(negedge clk_tb);
        rst_tb = 1'b1;
        idle_cycles(3);
        send_frame(8'hC3, 1'b1, 1'b0, 2);        // must work normally afterwards

        // ---------- Test 8: constrained random ----------
        $display("--- Test 8: random frames ---");
        for (i_tb = 0; i_tb < 100; i_tb = i_tb + 1) begin
            data_rand_tb     = $urandom;
            par_en_rand_tb   = $urandom;
            par_type_rand_tb = $urandom;
            send_frame(data_rand_tb, par_en_rand_tb, par_type_rand_tb, 2);
            if ($urandom_range(0, 3) == 0) idle_cycles($urandom_range(1, 4));
        end

        // ---------- Test 9: Data_valid high for a single clock only ----------
        // Parity_Calculator samples P_data_reg on the same edge that P_data_reg is loaded,
        // so with a 1-cycle Data_valid pulse the parity bit is computed from the OLD byte.
        if (RUN_PULSE_TEST) begin
            $display("--- Test 9: single-cycle Data_valid pulse (parity check) ---");
            send_frame(8'h00, 1'b1, 1'b0, 2);    // previous byte: parity 0
            send_frame(8'h01, 1'b1, 1'b0, 1);    // expected parity 1
            send_frame(8'h01, 1'b1, 1'b0, 1);    // expected parity 1 (previous byte now has parity 1)
            send_frame(8'h03, 1'b1, 1'b0, 1);    // expected parity 0
        end

        // ---------- Summary ----------
        idle_cycles(3);
        $display("=====================================");
        $display(" Checks: %0d   Errors: %0d", checks_tb, errors_tb);
        if (errors_tb == 0) $display(" RESULT: PASS");
        else                $display(" RESULT: FAIL");
        $display("=====================================");
        $finish;
    end

    // Watchdog
    initial begin
        #(CLK_PERIOD * 100000);
        $display("[TIMEOUT] simulation did not finish");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("UART_TX_top_tb.vcd");
        $dumpvars(0, UART_TX_top_tb);
    end

endmodule