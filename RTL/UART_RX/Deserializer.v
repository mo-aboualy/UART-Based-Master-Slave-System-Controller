module Deserializer (
    input            sampled_bit,
    input            deser_EN,
    input            in_start_state,
    input            clk, rst,
    output reg [7:0] P_DATA
);

    reg [2:0] counter;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            counter <= 0;
            P_DATA  <= 0;
        end
        else begin
            if (in_start_state) begin
                counter <= 0;
            end
            else if (deser_EN) begin
                P_DATA[counter] <= sampled_bit;
                counter         <= counter + 1;
            end
        end
    end

endmodule