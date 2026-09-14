`timescale 1ns/1ps

module Reset_SYNC_tb;

    reg  clk_Reset_SYNC_tb = 0;
    reg  rst_Reset_SYNC_tb;
    wire sync_rst_Reset_SYNC_tb;

    Reset_SYNC #(.NUM_STAGES(3)) dut (
        .clk(clk_Reset_SYNC_tb),
        .rst(rst_Reset_SYNC_tb),
        .sync_rst(sync_rst_Reset_SYNC_tb)
    );

    always #5 clk_Reset_SYNC_tb = ~clk_Reset_SYNC_tb;   // 10ns period

    initial begin
        rst_Reset_SYNC_tb = 0;      // hold reset
        #12;
        rst_Reset_SYNC_tb = 1;      // release reset (mid-cycle)

        #100;
        $finish;
    end

    initial begin
        $dumpfile("Reset_SYNC_tb.vcd");
        $dumpvars;
        $monitor("t=%0t clk=%b rst=%b sync_rst=%b",
                  $time, clk_Reset_SYNC_tb, rst_Reset_SYNC_tb, sync_rst_Reset_SYNC_tb);
    end

endmodule