`timescale 1ns / 1ps

module UART_RX_tb ();

    reg        RX_IN_tb;
    reg  [5:0] prescale_tb;
    reg        PAR_EN_tb, PAR_TYPE_tb;
    reg        clk_tb, rst_tb;
    wire       data_valid_tb;
    wire [7:0] P_DATA_tb;

    // Base TX Clock Period (1 / 115.2 KHz = 8680.555556 ns)
    parameter real TX_CLK_PERIOD = 8680.555556;
    real clk_half_period;

    UART_RX_top DUT (
        .RX_IN      (RX_IN_tb),
        .prescale   (prescale_tb),
        .PAR_EN     (PAR_EN_tb),
        .PAR_TYPE   (PAR_TYPE_tb),
        .clk        (clk_tb),
        .rst        (rst_tb),
        .data_valid (data_valid_tb),
        .P_DATA     (P_DATA_tb)
    );

    // Dynamic RX clock calculation derived from base TX period and prescale
    always @(prescale_tb) begin
        clk_half_period = (TX_CLK_PERIOD / prescale_tb) / 2.0;
    end

    always #(clk_half_period) clk_tb = ~clk_tb;

    task initialize;
        begin
            clk_tb      = 0;
            rst_tb      = 1;
            RX_IN_tb    = 1;
            prescale_tb = 6'd8;
            PAR_EN_tb   = 0;
            PAR_TYPE_tb = 0;
        end
    endtask

    task reset;
        begin
            rst_tb = 0;
        end
    endtask

    task release_reset;
        begin
            rst_tb = 1;
        end
    endtask

    task check_even_parity;
        begin
            PAR_EN_tb   = 1;
            PAR_TYPE_tb = 0;
        end
    endtask

    task check_odd_parity;
        begin
            PAR_EN_tb   = 1;
            PAR_TYPE_tb = 1;
        end
    endtask

    task check_no_parity;
        begin
            PAR_EN_tb   = 0;
            PAR_TYPE_tb = 0;
        end
    endtask

    task set_prescale;
        input [5:0] prescale_val;
        begin
            prescale_tb = prescale_val;
        end
    endtask

    task send_rx_frame;
        input [7:0] data;
        integer i;
        reg parity_bit;
        begin
            if (PAR_TYPE_tb == 0)
                parity_bit = ^data;        // Even Parity
            else
                parity_bit = ~(^data);     // Odd Parity

            // Start Bit (0)
            @(negedge clk_tb);
            RX_IN_tb = 0;
            repeat (prescale_tb) @(posedge clk_tb);

            // 8 Data Bits (LSB First)
            for (i = 0; i < 8; i = i + 1) begin
                RX_IN_tb = data[i];
                repeat (prescale_tb) @(posedge clk_tb);
            end

            // Parity Bit (if enabled)
            if (PAR_EN_tb) begin
                RX_IN_tb = parity_bit;
                repeat (prescale_tb) @(posedge clk_tb);
            end

            // Stop Bit (1)
            RX_IN_tb = 1;
            repeat (prescale_tb) @(posedge clk_tb);
        end
    endtask

    initial begin
        $dumpfile("UART_RX_tb.vcd");
        $dumpvars;

        $monitor("t=%0t rst=%b prescale=%0d RX_IN=%b data_valid=%b P_DATA=8'h%h PAR_EN=%b PAR_TYPE=%b",
                  $time, rst_tb, prescale_tb, RX_IN_tb, data_valid_tb, P_DATA_tb, PAR_EN_tb, PAR_TYPE_tb);

        initialize;
        reset;
        #10;
        release_reset;

        // -------------------------------------------------------------
        // TEST CASE 1: Prescale = 8 (RX_CLK = 115.2 KHz * 8 = 921.6 KHz)
        // -------------------------------------------------------------
        set_prescale(8);

        // No Parity Frame
        check_no_parity;
        send_rx_frame(8'hA5);
        #(clk_half_period * 20);

        // Even Parity Frame
        check_even_parity;
        send_rx_frame(8'hF3);
        #(clk_half_period * 20);

        // Odd Parity Frame
        check_odd_parity;
        send_rx_frame(8'h3C);
        #(clk_half_period * 20);

        // Consequent Frames (No IDLE Gap)
        check_even_parity;
        send_rx_frame(8'hA5);
        send_rx_frame(8'hF3);
        #(clk_half_period * 20);

        // -------------------------------------------------------------
        // TEST CASE 2: Prescale = 16 (RX_CLK = 115.2 KHz * 16 = 1.8432 MHz)
        // -------------------------------------------------------------
        set_prescale(16);

        check_even_parity;
        send_rx_frame(8'hB4);
        #(clk_half_period * 20);

        // -------------------------------------------------------------
        // TEST CASE 3: Prescale = 32 (RX_CLK = 115.2 KHz * 32 = 3.6864 MHz)
        // -------------------------------------------------------------
        set_prescale(32);

        check_odd_parity;
        send_rx_frame(8'hC7);
        #(clk_half_period * 20);

        $finish;
    end

endmodule