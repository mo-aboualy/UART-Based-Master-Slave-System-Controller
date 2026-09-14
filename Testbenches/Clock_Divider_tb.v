`timescale 1ns / 1ps

module Clock_Divider_tb ();

    reg        i_ref_clk_tb;
    reg        i_clk_en_tb;
    reg        i_rst_n_tb;
    reg  [7:0] i_div_ratio_tb;
    wire       o_div_clk_tb;

    Clock_Divider DUT (
        .i_ref_clk   (i_ref_clk_tb),
        .i_clk_en    (i_clk_en_tb),
        .i_rst_n     (i_rst_n_tb),
        .i_div_ratio (i_div_ratio_tb),
        .o_div_clk   (o_div_clk_tb)
    );

    task test_divide_by_1;
        begin
            i_clk_en_tb    = 'b1;
            i_div_ratio_tb = 'b1;
        end
    endtask

    task test_divide_by_0;
        begin
            i_clk_en_tb    = 'b1;
            i_div_ratio_tb = 'b0;
        end
    endtask

    task test_divide_by_even;
        begin
            i_clk_en_tb    = 'b1;
            i_div_ratio_tb = 'd2;
        end
    endtask

    task test_divide_by_odd;
        begin
            i_clk_en_tb    = 'b1;
            i_div_ratio_tb = 'd3;
        end
    endtask

    task reset;
        begin
            i_rst_n_tb = 0;
        end
    endtask

    task release_reset;
        begin
            i_rst_n_tb = 1;
        end
    endtask

    task initialize;
        begin
            i_ref_clk_tb   = 0;
            i_clk_en_tb    = 0;
            i_div_ratio_tb = 0;
        end
    endtask

    always #5 i_ref_clk_tb = ~i_ref_clk_tb;

    initial begin
        $monitor("t=%0t | rst_n=%b clk_en=%b ratio=%0d | ref_clk=%b -> div_clk=%b",
                  $time, i_rst_n_tb, i_clk_en_tb, i_div_ratio_tb,
                  i_ref_clk_tb, o_div_clk_tb);
    end

    initial begin
        $dumpfile("Clock_Divider_tb.vcd");
        $dumpvars;

        initialize;
        reset;
        #2  release_reset;

        #1  test_divide_by_0;
        #20 test_divide_by_1;
        #20 test_divide_by_even;
        #40 test_divide_by_odd;
        #80 $finish;
    end

endmodule