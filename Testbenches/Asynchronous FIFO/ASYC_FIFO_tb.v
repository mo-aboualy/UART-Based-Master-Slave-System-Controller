`timescale 1ns / 1ps

module ASYC_FIFO_tb ();

    parameter DATA_WIDTH = 8;

    reg  [DATA_WIDTH-1:0] W_data_tb;
    reg                   W_clk_tb, W_rst_tb, W_inc_tb;
    reg                   R_clk_tb, R_rst_tb, R_inc_tb;
    wire                  W_full_tb, R_empty_tb;
    wire [DATA_WIDTH-1:0] R_data_tb;

    reg                   start_tb;   

    ASYC_FIFO #(
        .DATA_WIDTH (DATA_WIDTH)
    ) DUT (
        .W_clk   (W_clk_tb),
        .W_rst   (W_rst_tb),
        .W_inc   (W_inc_tb),
        .R_clk   (R_clk_tb),
        .R_rst   (R_rst_tb),
        .R_inc   (R_inc_tb),
        .W_data  (W_data_tb),
        .W_full  (W_full_tb),
        .R_empty (R_empty_tb),
        .R_data  (R_data_tb)
    );

    always #5    W_clk_tb = ~W_clk_tb;   // 100 MHz
    always #12.5 R_clk_tb = ~R_clk_tb;   // 40 MHz

    task initialize;
        begin
            W_clk_tb  = 0;
            R_clk_tb  = 0;
            W_data_tb = 0;
            W_inc_tb  = 0;
            R_inc_tb  = 0;
            start_tb  = 0;
        end
    endtask

    task reset;
        begin
            W_rst_tb = 0;
            R_rst_tb = 0;
        end
    endtask

    task release_reset;
        begin
            W_rst_tb = 1;
            R_rst_tb = 1;
        end
    endtask

    task wr_byte;
        input [DATA_WIDTH-1:0] data;
        begin
            @(negedge W_clk_tb);
            wait (!W_full_tb);
            W_data_tb = data;
            W_inc_tb  = 1;
            @(negedge W_clk_tb);
            W_inc_tb  = 0;
        end
    endtask

    task rd_byte;
        begin
            @(negedge R_clk_tb);
            wait (!R_empty_tb);
            R_inc_tb = 1;
            @(negedge R_clk_tb);
            R_inc_tb = 0;
        end
    endtask

    integer i, j;

    
    initial begin
        $dumpfile("ASYC_FIFO_tb.vcd");
        $dumpvars;

        $monitor("t=%0t W_full=%b R_empty=%b W_data=%h R_data=%h",
                  $time, W_full_tb, R_empty_tb, W_data_tb, R_data_tb);

        initialize;
        reset;
        #20;
        release_reset;
        #1;
        start_tb = 1;

        for (i = 0; i < 9; i = i + 1) begin
            wr_byte(i);
        end
    end

    
    initial begin
        wait (start_tb);
        for (j = 0; j < 9; j = j + 1) begin
            rd_byte;
        end
        #50;
        $finish;
    end

endmodule