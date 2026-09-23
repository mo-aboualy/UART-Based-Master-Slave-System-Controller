module System_Controller #(
    parameter DATA_WIDTH = 8
)(
    // System Clock & Reset
    input  wire                    clk,
    input  wire                    rst,

    // Data Synchronizer Interface (From RX)
    input  wire [DATA_WIDTH-1:0]   P_data_sync,
    input  wire                    data_valid_sync,

    // Register File (RegFile) Interface
    input  wire [DATA_WIDTH-1:0]   RD_Data,
    input  wire                    RD_Valid,
    output reg                     WR_en,
    output reg                     RD_en,
    output reg  [3:0]              ADDR,
    output reg  [DATA_WIDTH-1:0]   WR_Data_regfile,

    // ALU & Clock Gating Interface
    input  wire [(2*DATA_WIDTH)-1:0] ALU_OUT,
    input  wire                      ALU_Valid,
    output reg  [3:0]                ALU_FUNC,
    output reg                       CLK_en,

    // ASYNC FIFO Interface (To TX)
    input  wire                    W_full,
    output reg  [DATA_WIDTH-1:0]   WR_DATA_fifo,
    output reg                     W_inc
);

    reg [3:0] current_state, next_state;

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
                     
    reg [3:0] store_address;
    reg [3:0] store_func;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            store_address <= 4'b0;
        else if (data_valid_sync && current_state == WR_ADDR) // Latch address so write data byte won't overwrite it
            store_address <= P_data_sync[3:0];
    end

    always @(posedge clk or negedge rst) begin
        if (!rst)
            store_func <= 4'b0;
        else if (data_valid_sync && (current_state == ALU_FUNC_OP || current_state == ALU_FUNC_NOP)) // Latch function code for multi-cycle ALU execution
            store_func <= P_data_sync[3:0];
    end

    always @(posedge clk or negedge rst) begin
        if (!rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            IDLE: begin
                if (data_valid_sync) begin
                    case (P_data_sync)
                        8'hAA: next_state = WR_ADDR;
                        8'hBB: next_state = RD_ADDR;
                        8'hCC: next_state = OP_A;
                        8'hDD: next_state = ALU_FUNC_NOP;
                        default: next_state = IDLE;
                    endcase
                end else begin
                    next_state = IDLE;
                end
            end

            WR_ADDR:      next_state = data_valid_sync ? WR_DATA : WR_ADDR;
            WR_DATA:      next_state = data_valid_sync ? IDLE : WR_DATA;

            RD_ADDR:      next_state = data_valid_sync ? RD_WAIT : RD_ADDR;
            RD_WAIT:      next_state = (RD_Valid && !W_full) ? IDLE : RD_WAIT; // Hold until read data is valid AND FIFO has room

            OP_A:         next_state = data_valid_sync ? OP_B : OP_A;
            OP_B:         next_state = data_valid_sync ? ALU_FUNC_OP : OP_B;

            ALU_FUNC_OP:  next_state = data_valid_sync ? ALU_WAIT : ALU_FUNC_OP;
            ALU_FUNC_NOP: next_state = data_valid_sync ? ALU_WAIT : ALU_FUNC_NOP;

            ALU_WAIT:     next_state = ALU_Valid ? ALU_OUT_L : ALU_WAIT; // Hold state until ALU completes calculation
            ALU_OUT_L:    next_state = !W_full ? ALU_OUT_H : ALU_OUT_L;   // Push lower 8 bits, wait if FIFO is full
            ALU_OUT_H:    next_state = !W_full ? IDLE : ALU_OUT_H;        // Push upper 8 bits, wait if FIFO is full

            default:      next_state = IDLE;
        endcase
    end

    always @(*) begin
        // Default outputs to prevent synthesis latches
        WR_en           = 1'b0;
        RD_en           = 1'b0;
        ADDR            = 4'b0;
        WR_Data_regfile = {DATA_WIDTH{1'b0}};
        ALU_FUNC        = 4'b0;
        CLK_en          = 1'b0;
        WR_DATA_fifo    = {DATA_WIDTH{1'b0}};
        W_inc           = 1'b0;

        case (current_state)
            IDLE: begin
            end

            WR_ADDR: begin
                ADDR = store_address;
            end

            WR_DATA: begin
                WR_en           = data_valid_sync ? 1'b1 : 1'b0; // Pulse write enable only when data byte is valid
                ADDR            = store_address;
                WR_Data_regfile = P_data_sync;
            end

            RD_ADDR: begin
                RD_en = data_valid_sync ? 1'b1 : 1'b0;
                ADDR  = P_data_sync[3:0]; // Extract 4-bit register address
            end

            RD_WAIT: begin
                if (!W_full && RD_Valid) begin
                    WR_DATA_fifo = RD_Data;
                    W_inc        = 1'b1; // Pulse write increment to register data into FIFO
                end
            end

            OP_A: begin
                WR_en           = data_valid_sync ? 1'b1 : 1'b0;
                ADDR            = 4'h0; // Address 0x0 is reserved for Operand A
                WR_Data_regfile = P_data_sync;
            end

            OP_B: begin
                WR_en           = data_valid_sync ? 1'b1 : 1'b0;
                ADDR            = 4'h1; // Address 0x1 is reserved for Operand B
                WR_Data_regfile = P_data_sync;
            end

            ALU_FUNC_OP, ALU_FUNC_NOP: begin
                CLK_en   = 1'b1; // Enable clock gating for ALU computation
                ALU_FUNC = data_valid_sync ? P_data_sync[3:0] : store_func;
            end

            ALU_WAIT: begin
                CLK_en   = 1'b1;
                ALU_FUNC = store_func; // Drive latched function code during calculation
            end

            ALU_OUT_L: begin
                CLK_en = 1'b1;
                if (!W_full) begin
                    WR_DATA_fifo = ALU_OUT[7:0]; // Slice lower byte of 16-bit ALU output
                    W_inc        = 1'b1;
                end
            end

            ALU_OUT_H: begin
                CLK_en = 1'b1;
                if (!W_full) begin
                    WR_DATA_fifo = ALU_OUT[15:8]; // Slice upper byte of 16-bit ALU output
                    W_inc        = 1'b1;
                end
            end
        endcase
    end

endmodule