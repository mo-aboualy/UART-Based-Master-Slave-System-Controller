`timescale 1ns / 1ps

module Data_Sync_tb ();
    parameter NUM_STAGES_TB = 8;
    parameter BUS_WIDTH_TB  = 8;
    
    reg  [BUS_WIDTH_TB-1:0] Unsync_bus_tb;
    reg                     bus_enable_tb;
    reg                     clk_tb, rst_tb;
    wire [BUS_WIDTH_TB-1:0] sync_bus_tb;
    wire                    enable_pulse_tb;

    Data_Sync DUT (
        .Unsync_bus   (Unsync_bus_tb),
        .bus_enable   (bus_enable_tb),
        .clk          (clk_tb),
        .rst          (rst_tb),
        .sync_bus     (sync_bus_tb),
        .enable_pulse (enable_pulse_tb)
    );

    always #2.5 clk_tb = ~clk_tb;

    task initialize;
        begin
            clk_tb        = 0;
            Unsync_bus_tb = 0;
            bus_enable_tb = 0;
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

    task send_data;
        input [BUS_WIDTH_TB-1:0] data;
        begin
            @(negedge clk_tb);
            Unsync_bus_tb = data;
            bus_enable_tb = 1;
            @(negedge clk_tb);
            bus_enable_tb = 0;
        end
    endtask
    
    task check_result;
        input [BUS_WIDTH_TB-1:0] expected;
        begin
            if (sync_bus_tb === expected)
                $display("t=%0t PASS: sync_bus=%h expected=%h", $time, sync_bus_tb, expected);
            else
                $display("t=%0t FAIL: sync_bus=%h expected=%h", $time, sync_bus_tb, expected);
        end
    endtask

    task wait_for_pulse;
        begin
            if (!enable_pulse_tb) @(posedge enable_pulse_tb);
            @(negedge clk_tb);
        end
    endtask

    initial begin
        $dumpfile("Data_Sync_tb.vcd");
        $dumpvars;

        $monitor("t=%0t rst=%b bus_enable=%b Unsync_bus=%h enable_pulse=%b sync_bus=%h",
                  $time, rst_tb, bus_enable_tb, Unsync_bus_tb, enable_pulse_tb, sync_bus_tb);

        initialize;
        reset;
        #1;
        release_reset;

        send_data(8'hA5);
        wait_for_pulse;
        check_result(8'hA5);
        
        send_data(8'h3C);
        wait_for_pulse;
        check_result(8'h3C);
        
        send_data(8'hFF);
        wait_for_pulse;
        check_result(8'hFF);
        
        $finish;
    end

endmodule