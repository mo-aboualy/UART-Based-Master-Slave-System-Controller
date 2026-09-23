module FIFO_MEM_CONTROL #(parameter DATA_WIDTH = 8)(
    input      [DATA_WIDTH-1:0] W_data,
    input                       W_inc,
    input                       W_full,
    input      [2:0]            W_addr,
    input      [2:0]            R_addr,
    input                       W_clk,
    output     [DATA_WIDTH-1:0] R_data
);

    wire W_clk_en = W_inc & !W_full;
    reg [DATA_WIDTH-1:0] MEM [7:0];

    always @(posedge W_clk) begin
        if (W_clk_en) begin
            MEM[W_addr] <= W_data;
        end
    end

    assign R_data = MEM[R_addr];   

endmodule