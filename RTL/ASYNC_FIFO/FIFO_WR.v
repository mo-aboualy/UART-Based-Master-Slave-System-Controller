module FIFO_WR (
    input               W_inc,
    input               W_clk,
    input               W_rst,
    input       [3:0]   SYNC_R_ptr,
    output wire [3:0]   W_ptr,
    output wire [2:0]   W_addr,
    output wire         W_full
);

    reg [3:0] W_counter;

    assign W_ptr  = W_counter ^ (W_counter >> 1);
    assign W_addr = W_counter[2:0];

    assign W_full = (W_ptr[3]   != SYNC_R_ptr[3])   &&
                     (W_ptr[2]   != SYNC_R_ptr[2])   &&
                     (W_ptr[1:0] == SYNC_R_ptr[1:0]);

    always @(posedge W_clk, negedge W_rst) begin
        if (!W_rst) begin
            W_counter <= 0;
        end
        else begin
            if (W_inc && !W_full) begin
                W_counter <= W_counter + 1;
            end
        end
    end

endmodule