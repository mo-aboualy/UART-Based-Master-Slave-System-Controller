`timescale 1ns / 1ps

module Clock_Gating_tb;

    reg CLK_en_tb;
    reg clk_tb;
    wire Gated_CLK_tb;

    // Instantiate the Unit Under Test (UUT)
    Clock_Gating uut (
        .CLK_en(CLK_en_tb),
        .clk(clk_tb),
        .Gated_CLK(Gated_CLK_tb)
    );

    // Clock generation (100 MHz)
    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

    // Stimulus process
    initial begin
        $dumpfile("clock_gating_tb.vcd");
        $dumpvars(0, Clock_Gating_tb);

        CLK_en_tb = 0;
        #15;

        // Enable during clock low
        @(negedge clk_tb);
        CLK_en_tb = 1;
        repeat (3) @(posedge clk_tb);

        // Glitch test: disable mid-high
        @(posedge clk_tb);
        #2;
        CLK_en_tb = 0;
        repeat (2) @(posedge clk_tb);

        // Glitch test: enable mid-high
        @(posedge clk_tb);
        #2;
        CLK_en_tb = 1;
        repeat (3) @(posedge clk_tb);

        // Disable during clock low
        @(negedge clk_tb);
        CLK_en_tb = 0;

        #30;
        $finish;
    end

    // Signal monitor
    initial begin
        $monitor("Time=%0t ns | clk_tb=%b | CLK_en_tb=%b | Gated_CLK_tb=%b", 
                 $time, clk_tb, CLK_en_tb, Gated_CLK_tb);
    end

endmodule