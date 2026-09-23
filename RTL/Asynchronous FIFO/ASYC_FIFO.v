module ASYC_FIFO #(
    parameter DATA_WIDTH = 8
)(
    input                       W_clk,
    input                       W_rst,
    input                       W_inc,
    input                       R_clk,
    input                       R_rst,
    input                       R_inc,
    input      [DATA_WIDTH-1:0] W_data,
    output                      W_full,
    output                      R_empty,
    output     [DATA_WIDTH-1:0] R_data
);

    wire [3:0] W_ptr,      R_ptr;
    wire [3:0] SYNC_W_ptr, SYNC_R_ptr;
    wire [2:0] W_addr,     R_addr;

    FIFO_MEM_CONTROL U0 (
        .W_data (W_data),
        .W_inc  (W_inc),
        .W_full (W_full),
        .W_addr (W_addr),
        .R_addr (R_addr),
        .W_clk  (W_clk),
        .R_data (R_data)
    );

    FIFO_WR U1 (
        .W_inc      (W_inc),
        .W_clk      (W_clk),
        .W_rst      (W_rst),
        .SYNC_R_ptr (SYNC_R_ptr),
        .W_ptr      (W_ptr),
        .W_addr     (W_addr),
        .W_full     (W_full)
    );

    FIFO_RD U2 (
        .R_inc      (R_inc),
        .R_clk      (R_clk),
        .R_rst      (R_rst),
        .SYNC_W_ptr (SYNC_W_ptr),
        .R_ptr      (R_ptr),
        .R_addr     (R_addr),
        .R_empty    (R_empty)
    );

        DF_SYNC U3_FIFO_WR (
        .ASYNC_data (R_ptr),
        .SYNC_data  (SYNC_R_ptr),
        .clk        (W_clk),
        .rst        (W_rst)
    );

    DF_SYNC U4_FIFO_RD (
        .ASYNC_data (W_ptr),
        .SYNC_data  (SYNC_W_ptr),
        .clk        (R_clk),
        .rst        (R_rst)
    );

endmodule