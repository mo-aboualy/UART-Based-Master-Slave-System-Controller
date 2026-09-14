`timescale 1ns / 1ps

module UART_TX_tb ();

    reg  [7:0] P_data_tb;
    reg        Data_valid_tb, PAR_EN_tb, PAR_type_tb;
    reg        clk_tb, rst_tb;
    wire       TX_OUT_tb, busy_tb;

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

    always #2.5 clk_tb = ~clk_tb;

    task initialize;
        begin
            clk_tb        = 0;
            P_data_tb     = 0;
            Data_valid_tb = 0;
            PAR_EN_tb     = 0;
            PAR_type_tb   = 0;
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
            PAR_type_tb = 0;
        end
    endtask

    task check_odd_parity;
        begin
            PAR_EN_tb   = 1;
            PAR_type_tb = 1;
        end
    endtask

    task check_no_parity;
        begin
            PAR_EN_tb = 0;
        end
    endtask

    task send_byte;
        input [7:0] data;
        begin
            @(negedge clk_tb);
            P_data_tb     = data;
            Data_valid_tb = 1;
            @(negedge clk_tb);
            Data_valid_tb = 0;
        end
    endtask

    task wait_for_done;
        begin
            if (!busy_tb) @(posedge busy_tb);
            @(negedge busy_tb);
        end
    endtask

    initial begin
        $dumpfile("UART_TX_tb.vcd");
        $dumpvars;

        $monitor("t=%0t rst=%b busy=%b TX_OUT=%b P_data=%b PAR_EN=%b PAR_type=%b",
                  $time, rst_tb, busy_tb, TX_OUT_tb, P_data_tb, PAR_EN_tb, PAR_type_tb);

        initialize;
        reset;
        #1;
        release_reset;

        check_no_parity;
        send_byte(8'b1000_1100);
        wait_for_done;

        check_even_parity;
        send_byte(8'b1000_1100);
        wait_for_done;

        check_odd_parity;
        send_byte(8'b1000_1100);
        wait_for_done;

        $finish;
    end

endmodule