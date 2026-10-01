`timescale 1ns / 1ps

module tb_UART_RX_top ();

    // -------------------------------------------------------------------------
    // Testbench Signals
    // -------------------------------------------------------------------------
    reg        clk;
    reg        rst;
    reg        RX_IN;
    reg  [5:0] prescale;
    reg        PAR_EN;
    reg        PAR_TYPE;

    wire       PAR_err;
    wire       STOP_err;
    wire       data_valid;
    wire [7:0] P_DATA;

    // Testbench tracking & monitoring variables
    integer test_num   = 0;
    integer pass_count = 0;
    integer fail_count = 0;

    reg       clear_valid_flag;
    reg       data_valid_captured;
    reg [7:0] captured_p_data;

    // Clock Generation (100 MHz clock -> 10ns period)
    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD / 2) clk = ~clk;

    // -------------------------------------------------------------------------
    // DUT Instantiation
    // -------------------------------------------------------------------------
    UART_RX_top DUT (
        .RX_IN(RX_IN),
        .prescale(prescale),
        .PAR_EN(PAR_EN),
        .PAR_TYPE(PAR_TYPE),
        .clk(clk),
        .rst(rst),
        .PAR_err(PAR_err),
        .STOP_err(STOP_err),
        .data_valid(data_valid),
        .P_DATA(P_DATA)
    );

    // -------------------------------------------------------------------------
    // Output Monitor Block (Captures data_valid pulses reliably)
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            data_valid_captured <= 1'b0;
            captured_p_data     <= 8'd0;
        end else if (clear_valid_flag) begin
            data_valid_captured <= 1'b0;
            captured_p_data     <= 8'd0;
        end else if (data_valid) begin
            data_valid_captured <= 1'b1;
            captured_p_data     <= P_DATA;
        end
    end

    // -------------------------------------------------------------------------
    // Testbench Tasks
    // -------------------------------------------------------------------------

    // 1. Reset Task
    task reset_dut;
        begin
            rst   = 1'b0;
            RX_IN = 1'b1; // Idle state line is HIGH
            #(CLK_PERIOD * 2);
            rst   = 1'b1;
            #(CLK_PERIOD * 2);
        end
    endtask

    // 2. Drive Single Bit for 'prescale' Clock Cycles
    task send_bit(input bit_val, input integer prescale_val);
        integer i;
        begin
            for (i = 0; i < prescale_val; i = i + 1) begin
                RX_IN = bit_val;
                @(negedge clk);
            end
        end
    endtask

    // 3. Send Full UART Frame
    task send_frame(
        input [7:0] data,
        input       par_en,
        input       par_type,
        input       par_err_inject,
        input       stop_err_inject,
        input [5:0] prescale_val
    );
        reg exp_parity;
        integer i;
        begin
            prescale = prescale_val;
            PAR_EN   = par_en;
            PAR_TYPE = par_type;

            // Calculate expected parity
            // Even (PAR_TYPE=0): parity = ^data
            // Odd  (PAR_TYPE=1): parity = ~^data
            exp_parity = par_type ? (~^data) : (^data);
            if (par_err_inject)
                exp_parity = ~exp_parity;

            // Send Start Bit (0)
            send_bit(1'b0, prescale_val);

            // Send Data Bits (LSB First)
            for (i = 0; i < 8; i = i + 1) begin
                send_bit(data[i], prescale_val);
            end

            // Send Parity Bit (If Enabled)
            if (par_en) begin
                send_bit(exp_parity, prescale_val);
            end

            // Send Stop Bit (1 normal, 0 if error injected)
            send_bit(stop_err_inject ? 1'b0 : 1'b1, prescale_val);
        end
    endtask

    // 4. Verify Frame Results
    task check_results(
        input [7:0]       exp_data,
        input             exp_valid,
        input             exp_par_err,
        input             exp_stop_err,
        input [8*40-1:0]  test_desc
    );
        reg match;
        begin
            match = 1'b1;

            // Give 2 extra clocks for signals to settle if needed
            #(CLK_PERIOD * 2);

            if (exp_valid && !data_valid_captured) begin
                $display("[FAIL] Test %0d (%s): Expected data_valid = 1, but none detected!", test_num, test_desc);
                match = 1'b0;
            end
            if (!exp_valid && data_valid_captured) begin
                $display("[FAIL] Test %0d (%s): Unexpected data_valid pulse observed!", test_num, test_desc);
                match = 1'b0;
            end
            if (exp_valid && (captured_p_data !== exp_data)) begin
                $display("[FAIL] Test %0d (%s): Expected P_DATA = 0x%0h, Received = 0x%0h", test_num, test_desc, exp_data, captured_p_data);
                match = 1'b0;
            end
            if (PAR_err !== exp_par_err) begin
                $display("[FAIL] Test %0d (%s): Expected PAR_err = %b, Got = %b", test_num, test_desc, exp_par_err, PAR_err);
                match = 1'b0;
            end
            if (STOP_err !== exp_stop_err) begin
                $display("[FAIL] Test %0d (%s): Expected STOP_err = %b, Got = %b", test_num, test_desc, exp_stop_err, STOP_err);
                match = 1'b0;
            end

            if (match) begin
                $display("[PASS] Test %0d: %s", test_num, test_desc);
                pass_count = pass_count + 1;
            end else begin
                fail_count = fail_count + 1;
            end

            test_num = test_num + 1;
        end
    endtask

    // -------------------------------------------------------------------------
    // Main Test Stimulus Sequence
    // -------------------------------------------------------------------------
    initial begin
        // Initialize Inputs
        clk              = 0;
        rst              = 1;
        RX_IN            = 1;
        prescale         = 8;
        PAR_EN           = 0;
        PAR_TYPE         = 0;
        clear_valid_flag = 0;

        $display("=================================================");
        $display("          Starting UART RX Top Testbench         ");
        $display("=================================================");

        // --- TEST 0: System Reset Check ---
        reset_dut();
        if (P_DATA === 8'h00 && data_valid === 1'b0 && PAR_err === 1'b0 && STOP_err === 1'b0) begin
            $display("[PASS] Test 0: Reset State Verified");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test 0: Reset State Verification Failed!");
            fail_count = fail_count + 1;
        end
        test_num = test_num + 1;

        // --- TEST 1: Normal Transmission (No Parity, Prescale = 8) ---
        clear_valid_flag = 1; #(CLK_PERIOD); clear_valid_flag = 0;
        send_frame(8'hA5, 1'b0, 1'b0, 1'b0, 1'b0, 6'd8);
        check_results(8'hA5, 1'b1, 1'b0, 1'b0, "No Parity, Data 0xA5, Prescale 8");

        // --- TEST 2: Valid Transmission (Even Parity, Prescale = 8) ---
        clear_valid_flag = 1; #(CLK_PERIOD); clear_valid_flag = 0;
        send_frame(8'h3B, 1'b1, 1'b0, 1'b0, 1'b0, 6'd8);
        check_results(8'h3B, 1'b1, 1'b0, 1'b0, "Even Parity Valid, Data 0x3B");

        // --- TEST 3: Valid Transmission (Odd Parity, Prescale = 8) ---
        clear_valid_flag = 1; #(CLK_PERIOD); clear_valid_flag = 0;
        send_frame(8'hC6, 1'b1, 1'b1, 1'b0, 1'b0, 6'd8);
        check_results(8'hC6, 1'b1, 1'b0, 1'b0, "Odd Parity Valid, Data 0xC6");

        // --- TEST 4: Parity Error Injection ---
        clear_valid_flag = 1; #(CLK_PERIOD); clear_valid_flag = 0;
        send_frame(8'h55, 1'b1, 1'b0, 1'b1, 1'b0, 6'd8); // Corrupt parity
        check_results(8'h55, 1'b0, 1'b1, 1'b0, "Parity Error Injection");

        // --- TEST 5: Glitch / Start Bit Error ---
        clear_valid_flag = 1; #(CLK_PERIOD); clear_valid_flag = 0;
        prescale = 8;
        // Start bit goes 0 for 2 cycles then back to 1 (corrupted start bit)
        send_bit(1'b0, 2);
        send_bit(1'b1, 6);
        check_results(8'h00, 1'b0, 1'b0, 1'b0, "Start Bit Glitch / Start Error Handling");

        // --- TEST 6 & 7: Back-To-Back Frames (Prescale = 16) ---
        reset_dut();
        clear_valid_flag = 1; #(CLK_PERIOD); clear_valid_flag = 0;
        
        // Frame 1
        send_frame(8'h12, 1'b0, 1'b0, 1'b0, 1'b0, 6'd16);
        check_results(8'h12, 1'b1, 1'b0, 1'b0, "Back-To-Back Frame 1 (Prescale 16)");

        // Frame 2 immediately follows
        clear_valid_flag = 1; #(CLK_PERIOD); clear_valid_flag = 0;
        send_frame(8'h89, 1'b0, 1'b0, 1'b0, 1'b0, 6'd16);
        check_results(8'h89, 1'b1, 1'b0, 1'b0, "Back-To-Back Frame 2 (Prescale 16)");

        // --- Final Test Summary ---
        $display("=================================================");
        $display("                 TEST SUMMARY                    ");
        $display("  Total Tests Run : %0d", test_num);
        $display("  Passed Tests    : %0d", pass_count);
        $display("  Failed Tests    : %0d", fail_count);
        $display("=================================================");

        if (fail_count == 0)
            $display(">>> ALL TESTS PASSED SUCCESSFULLY! <<<");
        else
            $display(">>> TEST SUITE FAILED WITH %0d ERRORS <<<", fail_count);

        $finish;
    end

endmodule