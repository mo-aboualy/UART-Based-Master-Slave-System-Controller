module System_TOP_DFT (
    // -------------------------------------------------------------------------
    // Top-Level Inputs & Outputs
    // -------------------------------------------------------------------------
    input  wire       REF_CLK,        // 50 MHz Reference Clock (Domain 1)
    input  wire       UART_CLK,       // 3.6864 MHz UART Clock (Domain 2)
    input  wire       RST,            // Active-Low Asynchronous Global Reset
    input  wire       RX_IN,          // Serial Input Stream / Parallel RX Input (bit 0 = actual serial line)
    output wire       TX_OUT,         // Serial Output Stream / Parallel TX Output (bit 0 = actual serial line)
    output wire       PAR_err,        // Frame parity error
    output wire       STOP_err,       // Frame stop error
    input  wire [2:0] SI,	      // Scan Chain Input
    input  wire       SE,	      // Scan Enable
    input  wire       test_mode,      // Test Mode
    input  wire       scan_clk,       // Scan Clock
    input  wire       scan_rst,       // Scan Reset
    output wire [2:0] SO	      // Scan Chain Output
);

    // =========================================================================
    // Internal Signals Declaration
    // =========================================================================
    
    // --- DFT MUXed Clock & Reset ---
    wire        REF_CLK_M;
    wire        UART_CLK_M;
    wire        TX_CLK_M;
    wire        RX_CLK_M;
    wire        RST_M;
    wire        RST_Domain_1_M;
    wire	RST_Domain_2_M;

    // --- Clock Domain 1 (REF_CLK Domain) Core Signals ---
    wire        RST_Domain_1;          // Synchronized Reset for REF_CLK Domain
    wire        ALU_CLK;               // Gated Clock supplied to ALU
    wire        CLK_en;                // ALU Clock Gating enable from SYS_CTRL

    // --- Clock Domain 2 (UART_CLK Domain) Core Signals ---
    wire        RST_Domain_2;          // Synchronized Reset for UART_CLK Domain
    wire        RX_CLK;                // Divided Clock for RX logic
    wire        TX_CLK;                // Divided Clock for TX logic

    // --- Clock Dividers & System Configuration ---
    wire [7:0]  RX_DIV_Ratio;          // RX Clock Division Ratio (from Prescale MUX)
    wire [7:0]  TX_DIV_Ratio;          // TX Clock Division Ratio (from RegFile REG3)
    wire [7:0]  UART_CONFIG;           // Configuration Reg (REG2: [7:2] Prescale, [1] Parity Type, [0] Parity En)

    // --- Register File Interface Signals ---
    wire [3:0]  address;               // Register File Address bus
    wire [7:0]  WR_Data;               // Register Write Data bus
    wire [7:0]  RD_Data;               // Register Read Data bus
    wire        WR_en;                 // Register Write Enable flag
    wire        RD_en;                 // Register Read Enable flag
    wire        RD_Valid;              // Register Read Data Valid flag

    // --- ALU Interface Signals ---
    wire [7:0]  OP_A;                  // Operand A (from RegFile REG0)
    wire [7:0]  OP_B;                  // Operand B (from RegFile REG1)
    wire [3:0]  ALU_FUNC;              // ALU Operation Select control
    wire [15:0] ALU_OUT;               // ALU Result Output bus
    wire        ALU_Valid;             // ALU Output Valid signal

    // --- UART RX & Data Synchronizer Signals ---
    wire [7:0]  RX_P_DATA;             // Unsynchronized parallel data output from UART RX
    wire        RX_data_valid;         // Unsynchronized data valid flag from UART RX
    wire [7:0]  RX_P_DATA_synced;      // Synchronized RX data bus to REF_CLK Domain
    wire        RX_data_valid_synced;  // Synchronized RX data valid pulse to REF_CLK Domain

    // --- UART TX & Pulse Generator Signals ---
    wire        busy;                  // UART TX Busy status signal
    wire        R_inc;                 // Synchronized enable pulse for FIFO read trigger

    // --- ASYNC FIFO (SYS_CTRL -> UART_TX) Signals ---
    wire        W_inc;                 // FIFO write-enable from SYS_CTRL
    wire        W_full;                // FIFO full flag to SYS_CTRL
    wire [7:0]  WR_DATA_fifo;          // FIFO write data from SYS_CTRL
    wire [7:0]  TX_P_data;             // FIFO read data -> UART_TX parallel data
    wire        R_empty;               // FIFO empty flag
    wire        TX_Data_valid;         // = ~R_empty, drives UART_TX Data_valid


    // =========================================================================
    // Module Instantiations
    // =========================================================================

    // -------------------------------------------------------------------------
    // 1. Reset Synchronizers
    // -------------------------------------------------------------------------
    Reset_SYNC Domain_1_Reset (
        .clk      (REF_CLK_M),
        .rst      (RST_M),
        .sync_rst (RST_Domain_1)
    );

    Reset_SYNC Domain_2_Reset (
        .clk      (UART_CLK_M),
        .rst      (RST_M),
        .sync_rst (RST_Domain_2)
    );

    // -------------------------------------------------------------------------
    // 2. Clock Management & Control
    // -------------------------------------------------------------------------
    Prescale_MUX Prescale_MUX (
        .prescale  (UART_CONFIG[7:2]),
        .Div_ratio (RX_DIV_Ratio)
    );

    Clock_Divider RX_Clock_Divider (
        .i_ref_clk   (UART_CLK_M),
        .i_clk_en    (1'b1),
        .i_rst_n     (RST_Domain_2_M),
        .i_div_ratio (RX_DIV_Ratio),
        .o_div_clk   (RX_CLK)
    );

    Clock_Divider TX_Clock_Divider (
        .i_ref_clk   (UART_CLK_M),
        .i_clk_en    (1'b1),
        .i_rst_n     (RST_Domain_2_M),
        .i_div_ratio (TX_DIV_Ratio),
        .o_div_clk   (TX_CLK)
    );

    Clock_Gating Clock_Gating (
        .CLK_en    (CLK_en),
	.test_mode (test_mode),
        .clk       (REF_CLK_M),
        .Gated_CLK (ALU_CLK)
    );

    // -------------------------------------------------------------------------
    // 3. Register File & Core Arithmetic Logic
    // -------------------------------------------------------------------------
    register_file Register_File (
        .clk      (REF_CLK_M),
        .rst      (RST_Domain_1_M),
        .address  (address),
        .WR_Data  (WR_Data),
        .WR_en    (WR_en),
        .RD_en    (RD_en),
        .RD_Data  (RD_Data),
        .RD_Valid (RD_Valid),
        .REG0     (OP_A),
        .REG1     (OP_B),
        .REG2     (UART_CONFIG),
        .REG3     (TX_DIV_Ratio)
    );

    alu_top ALU (
        .clk       (ALU_CLK),
        .rst       (RST_Domain_1_M),
        .a         (OP_A),
        .b         (OP_B),
        .alu_fun   (ALU_FUNC),
        .ALU_OUT   (ALU_OUT),
        .ALU_Valid (ALU_Valid)
    );

    // -------------------------------------------------------------------------
    // 4. Data Synchronization & Control Pulse Generation
    // -------------------------------------------------------------------------
    Data_Sync Data_Synchronizer (
        .clk          (REF_CLK_M),
        .rst          (RST_Domain_1_M),
        .Unsync_bus   (RX_P_DATA),
        .bus_enable   (RX_data_valid),
        .sync_bus     (RX_P_DATA_synced),
        .enable_pulse (RX_data_valid_synced)
    );

    Pulse_Generator Pulse_Generator (
        .clk          (TX_CLK_M),
        .rst          (RST_Domain_2_M),
        .bus_enable   (busy),
        .enable_pulse (R_inc)
    );

    // -------------------------------------------------------------------------
    // 5. System Controller (main FSM)
    // -------------------------------------------------------------------------
    System_Controller SYS_CTRL (
        .clk             (REF_CLK_M),
        .rst             (RST_Domain_1_M),

        .P_data_sync     (RX_P_DATA_synced),
        .data_valid_sync (RX_data_valid_synced),

        .RD_Data         (RD_Data),
        .RD_Valid        (RD_Valid),
        .WR_en           (WR_en),
        .RD_en           (RD_en),
        .ADDR            (address),
        .WR_Data_regfile (WR_Data),

        .ALU_OUT         (ALU_OUT),
        .ALU_Valid       (ALU_Valid),
        .ALU_FUNC        (ALU_FUNC),
        .CLK_en          (CLK_en),

        .W_full          (W_full),
        .WR_DATA_fifo    (WR_DATA_fifo),
        .W_inc           (W_inc)
    );

    // -------------------------------------------------------------------------
    // 6. Async FIFO (SYS_CTRL write side, UART_TX read side)
    // -------------------------------------------------------------------------
    ASYC_FIFO #(.DATA_WIDTH(8)) TX_FIFO (
        .W_clk   (REF_CLK_M),
        .W_rst   (RST_Domain_1_M),
        .W_inc   (W_inc),
        .W_data  (WR_DATA_fifo),
        .W_full  (W_full),

        .R_clk   (TX_CLK_M),
        .R_rst   (RST_Domain_2_M),
        .R_inc   (R_inc),
        .R_data  (TX_P_data),
        .R_empty (R_empty)
    );

    assign TX_Data_valid = ~R_empty;

    // -------------------------------------------------------------------------
    // 7. UART TX/RX Wrapper
    // -------------------------------------------------------------------------
    UART_TOP UART (
        .rst           (RST_Domain_2_M),

        .PAR_EN        (UART_CONFIG[0]),
        .PAR_type      (UART_CONFIG[1]),

        .TX_P_data     (TX_P_data),
        .TX_Data_valid (TX_Data_valid),
        .TX_CLK        (TX_CLK_M),
        .TX_OUT        (TX_OUT),
        .TX_busy       (busy),

        .RX_IN         (RX_IN),
        .prescale      (UART_CONFIG[7:2]),
        .RX_CLK        (RX_CLK_M),
        .RX_data_valid (RX_data_valid),
        .PAR_err       (PAR_err),
        .STOP_err      (STOP_err),
        .RX_P_DATA     (RX_P_DATA)
    );

    // -------------------------------------------------------------------------
    // 8. DFT Multiplexers
    // -------------------------------------------------------------------------
    mux2X1 REF_CLK_MUX (
    	.IN_0	       (REF_CLK),
     	.IN_1          (scan_clk),       
        .SEL           (test_mode),  
    	.OUT           (REF_CLK_M)
    );

    mux2X1 UART_CLK_MUX (
    	.IN_0	       (UART_CLK),
     	.IN_1          (scan_clk),       
        .SEL           (test_mode),  
    	.OUT           (UART_CLK_M)
    ); 
 
    mux2X1 TX_CLK_MUX (
    	.IN_0	       (TX_CLK),
     	.IN_1          (scan_clk),       
        .SEL           (test_mode),  
    	.OUT           (TX_CLK_M)
    ); 

    mux2X1 RX_CLK_MUX (
    	.IN_0	       (RX_CLK),
     	.IN_1          (scan_clk),       
        .SEL           (test_mode),  
    	.OUT           (RX_CLK_M)
    );

    mux2X1 REF_Reset_MUX (
    	.IN_0	       (RST),
     	.IN_1          (scan_rst),       
        .SEL           (test_mode),  
    	.OUT           (RST_M)
    );

    mux2X1 Domain_1_Reset_MUX (
    	.IN_0	       (RST_Domain_1),
     	.IN_1          (scan_rst),       
        .SEL           (test_mode),  
    	.OUT           (RST_Domain_1_M)
    );
   
    mux2X1 Domain_2_Reset_MUX (
    	.IN_0	       (RST_Domain_2),
     	.IN_1          (scan_rst),       
        .SEL           (test_mode),  
    	.OUT           (RST_Domain_2_M)
    );
endmodule
