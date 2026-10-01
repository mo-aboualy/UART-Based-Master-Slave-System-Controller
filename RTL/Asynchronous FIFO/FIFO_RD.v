module FIFO_RD (
    input               R_inc,
    input               R_clk,
    input               R_rst,
    input        [3:0]  SYNC_W_ptr,
    output reg   [3:0]  R_ptr,        // Registered output (Flop-based)
    output wire  [2:0]  R_addr,
    output wire         R_empty
);

    reg  [3:0] R_counter;
    wire [3:0] R_counter_next;
    wire [3:0] R_ptr_next;

    assign R_addr  = R_counter[2:0];
    assign R_empty = (R_ptr == SYNC_W_ptr);

    // Compute next binary counter and next Gray pointer combinationally
    assign R_counter_next = (R_inc && !R_empty) ? (R_counter + 1'b1) : R_counter;
    assign R_ptr_next     = R_counter_next ^ (R_counter_next >> 1);

    // Register BOTH R_counter and R_ptr on the clock edge
    always @(posedge R_clk or negedge R_rst) begin
        if (!R_rst) begin
            R_counter <= 4'b0;
            R_ptr     <= 4'b0;
        end else begin
            R_counter <= R_counter_next;
            R_ptr     <= R_ptr_next;
        end
    end

endmodule