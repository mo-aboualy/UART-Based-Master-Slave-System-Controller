module DF_SYNC (
    input       [3:0] ASYNC_data,
    input              clk,
    input              rst,
    output      [3:0] SYNC_data
);

    reg [3:0] stage1, stage2;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            stage1 <= 0;
            stage2 <= 0;
        end
        else begin
            stage1 <= ASYNC_data;
            stage2 <= stage1;
        end
    end

    assign SYNC_data = stage2;

endmodule