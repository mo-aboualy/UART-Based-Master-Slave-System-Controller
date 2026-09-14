module FIFO_RD (
    input               R_inc,
    input               R_clk,
    input               R_rst,
    input       [3:0]   SYNC_W_ptr,
    output wire [3:0]   R_ptr,
    output wire [2:0]   R_addr,
    output wire         R_empty
);

    reg [3:0] R_counter;

    assign R_ptr   = R_counter ^ (R_counter >> 1);
    assign R_addr  = R_counter[2:0];
    assign R_empty = (R_ptr == SYNC_W_ptr);

    always @(posedge R_clk, negedge R_rst) begin
        if (!R_rst) begin
            R_counter <= 0;
        end
        else begin
            if (R_inc && !R_empty) begin
                R_counter <= R_counter + 1;
            end
        end
    end

endmodule