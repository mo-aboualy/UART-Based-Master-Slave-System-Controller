`timescale 1ns / 1ps

module System_Controller_tb();

    // System Parameters
    parameter DATA_WIDTH  = 8;
    parameter CLK_PERIOD  = 10; // 100 MHz Clock

    // DUT Inputs
    reg                    clk;
    reg                    rst;
    reg [DATA_WIDTH-1:0]   P_data_sync;
    reg                    data_valid_sync;
    reg [DATA_WIDTH-1:0]   RD_Data;
    reg                    RD_Valid;
    reg [(2*DATA_WIDTH)-1:0] ALU_OUT;
    reg                    ALU_Valid;
    reg                    W_full;

    // DUT Outputs
    wire                   WR_en;
    wire                   RD_en;
    wire [3:0]             ADDR;
    wire [DATA_WIDTH-1:0]  WR_Data_regfile;
    wire [3:0]             ALU_FUNC;
    wire                   CLK_en;
    wire [DATA_WIDTH-1:0]  WR_DATA_fifo;
    wire                   W_inc;

    // FSM Encoding
    localparam [3:0] IDLE         = 4'b0000, 
                     WR_ADDR      = 4'b0001, 
                     WR_DATA      = 4'b0010, 
                     RD_ADDR      = 4'b0011, 
                     RD_WAIT      = 4'b0100,
                     OP_A         = 4'b0101, 
                     OP_B         = 4'b0110,
                     ALU_FUNC_OP  = 4'b0111,
                     ALU_FUNC_NOP = 4'b1000,
                     ALU_WAIT     = 4'b1001, 
                     ALU_OUT_L    = 4'b1010,
                     ALU_OUT_H    = 4'b1011;

    // Instantiate DUT
    System_Controller #(
        .DATA_WIDTH(DATA_WIDTH)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .P_data_sync(P_data_sync),
        .data_valid_sync(data_valid_sync),
        .RD_Data(RD_Data),
        .RD_Valid(RD_Valid),
        .WR_en(WR_en),
        .RD_en(RD_en),
        .ADDR(ADDR),
        .WR_Data_regfile(WR_Data_regfile),
        .ALU_OUT(ALU_OUT),
        .ALU_Valid(ALU_Valid),
        .ALU_FUNC(ALU_FUNC),
        .CLK_en(CLK_en),
        .W_full(W_full),
        .WR_DATA_fifo(WR_DATA_fifo),
        .W_inc(W_inc)
    );

    // Clock Generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Task: Drive a single-cycle pulse at negedge
    task send_data_pulse(input [DATA_WIDTH-1:0] data);
    begin
        @(negedge clk);
        P_data_sync     = data;
        data_valid_sync = 1'b1;
        @(negedge clk);
        data_valid_sync = 1'b0;
        P_data_sync     = 8'h00;
    end
    endtask

    // Task: Check state on next posedge clk
    task check_state(input [3:0] expected_state, input [8*25:1] state_name);
    begin
        @(posedge clk);
        #1; // Small delta delay for register propagation
        if (DUT.current_state === expected_state) begin
            $display("[TIME %0t ns] PASS: Transited to State: %s", $time, state_name);
        end else begin
            $display("[TIME %0t ns] FAIL: Expected State: %s, Got: 4'b%b", $time, state_name, DUT.current_state);
        end
    end
    endtask

    initial begin
        clk             = 0;
        rst             = 1;
        P_data_sync     = 0;
        data_valid_sync = 0;
        RD_Data         = 8'h55;
        RD_Valid        = 0;
        ALU_OUT         = 16'hABCD;
        ALU_Valid       = 0;
        W_full          = 0;

        $display("--------------------------------------------------");
        $display("     SYSTEM CONTROLLER STATE TRANSITION TESTBENCH ");
        $display("--------------------------------------------------");

        // TEST 0: Reset
        $display("\n--- Test 0: Reset Transition ---");
        #(CLK_PERIOD);
        rst = 0;
        #(CLK_PERIOD);
        rst = 1;
        check_state(IDLE, "IDLE");

        // TEST 1: Register Write Sequence
        $display("\n--- Test 1: Register Write State Transitions ---");
        send_data_pulse(8'hAA);
        check_state(WR_ADDR, "WR_ADDR");

        send_data_pulse(8'h04);
        check_state(WR_DATA, "WR_DATA");

        send_data_pulse(8'hDE);
        check_state(IDLE, "IDLE");

        // TEST 2: Register Read Sequence with Stall
        $display("\n--- Test 2: Register Read & Stall Transitions ---");
        send_data_pulse(8'hBB);
        check_state(RD_ADDR, "RD_ADDR");

        send_data_pulse(8'h04);
        check_state(RD_WAIT, "RD_WAIT");

        // Stall on W_full
        @(negedge clk);
        W_full   = 1'b1;
        RD_Valid = 1'b1;
        check_state(RD_WAIT, "RD_WAIT (Stalled on W_full)");

        // Clear W_full
        @(negedge clk);
        W_full   = 1'b0;
        RD_Valid = 1'b1;
        check_state(IDLE, "IDLE");
        
        @(negedge clk);
        RD_Valid = 1'b0;

        // TEST 3: ALU With Operands
        $display("\n--- Test 3: ALU With Operands Transitions ---");
        send_data_pulse(8'hCC);
        check_state(OP_A, "OP_A");

        send_data_pulse(8'h10);
        check_state(OP_B, "OP_B");

        send_data_pulse(8'h20);
        check_state(ALU_FUNC_OP, "ALU_FUNC_OP");

        send_data_pulse(8'h01);
        check_state(ALU_WAIT, "ALU_WAIT");

        // Assert ALU_Valid at negedge
        @(negedge clk);
        ALU_Valid = 1'b1;
        check_state(ALU_OUT_L, "ALU_OUT_L");

        @(negedge clk);
        ALU_Valid = 1'b0;
        check_state(ALU_OUT_H, "ALU_OUT_H");

        check_state(IDLE, "IDLE");

        // TEST 4: ALU NOP with FIFO Stall
        $display("\n--- Test 4: ALU NOP & FIFO Stall Transitions ---");
        send_data_pulse(8'hDD);
        check_state(ALU_FUNC_NOP, "ALU_FUNC_NOP");

        send_data_pulse(8'h02);
        check_state(ALU_WAIT, "ALU_WAIT");

        // Trigger ALU computation complete
        @(negedge clk);
        ALU_Valid = 1'b1;
        check_state(ALU_OUT_L, "ALU_OUT_L");

        // Apply FIFO stall on ALU_OUT_L
        @(negedge clk);
        ALU_Valid = 1'b0;
        W_full    = 1'b1;
        check_state(ALU_OUT_L, "ALU_OUT_L (Stalled on W_full)");

        // Release FIFO stall
        @(negedge clk);
        W_full = 1'b0;
        check_state(ALU_OUT_H, "ALU_OUT_H");

        check_state(IDLE, "IDLE");

        // TEST 5: Invalid Command Handling
        $display("\n--- Test 5: Invalid Command Handling ---");
        send_data_pulse(8'hFF);
        check_state(IDLE, "IDLE (Invalid Opcode Ignored)");

        $display("\n--------------------------------------------------");
        $display("     ALL STATE TRANSITION TESTS COMPLETED          ");
        $display("--------------------------------------------------");
        $finish;
    end

endmodule