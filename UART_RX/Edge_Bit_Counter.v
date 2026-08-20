module Edge_Bit_Counter (
    input            edge_bit_EN,
    input            in_data_state,
    input            in_start_state,
    input      [5:0] prescale,
    input            clk, rst,
    output reg [4:0] edge_count,
    output reg [3:0] bit_count
);

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            edge_count <= 0;
            bit_count  <= 0;
        end
        else begin
            if (!edge_bit_EN) begin
                edge_count <= 0;
                bit_count  <= 0;
            end
            else begin
                if (edge_count != prescale - 1)
                    edge_count <= edge_count + 1;
                else
                    edge_count <= 0;

                if (in_start_state)
                    bit_count <= 0;
                else if (in_data_state && (edge_count == prescale - 1))
                    bit_count <= bit_count + 1;
            end
        end
    end

endmodule