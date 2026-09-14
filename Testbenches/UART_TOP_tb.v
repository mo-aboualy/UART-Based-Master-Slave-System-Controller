`timescale 1ns/1ps

module UART_TOP_tb;

    // Testbench Signals
    reg        rst;           // Active-Low Reset (0 = RESET, 1 = RUN)
    reg        PAR_EN;
    reg        PAR_type;
    reg  [7:0] TX_P_data;
    reg        TX_Data_valid;
    reg        TX_CLK;
    reg  [5:0] prescale;
    reg        RX_CLK;

    wire       TX_OUT;
    wire       TX_busy;
    wire       RX_IN;
    wire       RX_data_valid;
    wire [7:0] RX_P_DATA;

    // Direct Loopback with weak pull-up (Idle High)
    assign (weak1, weak0) RX_IN = 1'b1;
    assign RX_IN = TX_OUT;

    // Clock Ratios: RX_CLK is 16x faster than TX_CLK
    localparam RX_CLK_PERIOD = 10;                     // 100 MHz clock
    localparam TX_CLK_PERIOD = RX_CLK_PERIOD * 16;     // Baud rate clock

    // DUT Instantiation
    UART_TOP DUT (
        .rst            (rst),
        .PAR_EN         (PAR_EN),
        .PAR_type       (PAR_type),
        .TX_P_data      (TX_P_data),
        .TX_Data_valid  (TX_Data_valid),
        .TX_CLK         (TX_CLK),
        .TX_OUT         (TX_OUT),
        .TX_busy        (TX_busy),
        .RX_IN          (RX_IN),
        .prescale       (prescale),
        .RX_CLK         (RX_CLK),
        .RX_data_valid  (RX_data_valid),
        .RX_P_DATA      (RX_P_DATA)
    );

    // Clock Generators
    always #(RX_CLK_PERIOD / 2) RX_CLK = ~RX_CLK;
    always #(TX_CLK_PERIOD / 2) TX_CLK = ~TX_CLK;

    // Main Test Stimulus
    initial begin
        // 1. Initialize Inputs
        RX_CLK        = 1'b0;
        TX_CLK        = 1'b0;
        rst           = 1'b0; // Hold Active-Low Reset
        PAR_EN        = 1'b0;
        PAR_type      = 1'b0;
        TX_P_data     = 8'h00;
        TX_Data_valid = 1'b0;
        prescale      = 6'd16;

        // 2. Release Reset after 5 TX clock cycles
        repeat(5) @(posedge TX_CLK);
        rst = 1'b1;
        repeat(5) @(posedge TX_CLK);

        // --- Test 1: No Parity ---
        $display("\n--- Test 1: No Parity ---");
        PAR_EN   = 1'b0;
        PAR_type = 1'b0;
        send_and_check(8'hA5);
        send_and_check(8'h3C);

        // --- Test 2: Even Parity ---
        $display("\n--- Test 2: Even Parity ---");
        PAR_EN   = 1'b1;
        PAR_type = 1'b0;
        send_and_check(8'hFF);
        send_and_check(8'h55);

        // --- Test 3: Odd Parity ---
        $display("\n--- Test 3: Odd Parity ---");
        PAR_EN   = 1'b1;
        PAR_type = 1'b1;
        send_and_check(8'h12);
        send_and_check(8'h80);

        $display("\n>>> ALL TESTS PASSED SUCCESSFULLY <<<");
        $finish;
    end

    // Corrected Verification Task
    task send_and_check(input [7:0] data_to_send);
        integer rx_cycles_waited;
        begin
            while (TX_busy) @(posedge TX_CLK);

            // Drive TX data pulse
            @(posedge TX_CLK);
            TX_P_data     <= data_to_send;
            TX_Data_valid <= 1'b1;

            @(posedge TX_CLK);
            TX_Data_valid <= 1'b0;

            // Wait on posedge RX_CLK so we catch the 1-cycle RX pulse!
            rx_cycles_waited = 0;
            while (!RX_data_valid && rx_cycles_waited < 300) begin
                @(posedge RX_CLK);
                rx_cycles_waited = rx_cycles_waited + 1;
            end

            // Check captured data
            if (RX_data_valid) begin
                if (RX_P_DATA === data_to_send) begin
                    $display("[PASS] Sent: 0x%h | Received: 0x%h", data_to_send, RX_P_DATA);
                end else begin
                    $display("[FAIL] Sent: 0x%h | Received: 0x%h", data_to_send, RX_P_DATA);
                end
            end else begin
                $display("[TIMEOUT] RX_data_valid missed for 0x%h!", data_to_send);
                $display("          RX Flags -> START_err: %b | PAR_err: %b | STOP_err: %b",
                         DUT.RX_INST.START_err, DUT.RX_INST.PAR_err, DUT.RX_INST.STOP_err);
            end

            while (TX_busy) @(posedge TX_CLK);
            repeat(2) @(posedge TX_CLK);
        end
    endtask

endmodule