module FIFO_WR (
    input               W_inc,
    input               W_clk,
    input               W_rst,
    input        [3:0]  SYNC_R_ptr,
    output reg   [3:0]  W_ptr,        // Registered output (Flop-based)
    output wire  [2:0]  W_addr,
    output wire         W_full
);

    reg  [3:0] W_counter;
    wire [3:0] W_counter_next;
    wire [3:0] W_ptr_next;

    assign W_addr = W_counter[2:0];

    assign W_full = (W_ptr[3]   != SYNC_R_ptr[3])   &&
                    (W_ptr[2]   != SYNC_R_ptr[2])   &&
                    (W_ptr[1:0] == SYNC_R_ptr[1:0]);

    // Compute next binary counter and next Gray pointer combinationally
    assign W_counter_next = (W_inc && !W_full) ? (W_counter + 1'b1) : W_counter;
    assign W_ptr_next     = W_counter_next ^ (W_counter_next >> 1);

    // Register BOTH W_counter and W_ptr on the clock edge
    always @(posedge W_clk or negedge W_rst) begin
        if (!W_rst) begin
            W_counter <= 4'b0;
            W_ptr     <= 4'b0;
        end else begin
            W_counter <= W_counter_next;
            W_ptr     <= W_ptr_next;
        end
    end

endmodule