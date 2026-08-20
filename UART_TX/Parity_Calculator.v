module Parity_Calculator (
    input        [7:0] P_data,
    input               PAR_type,
    input               Data_valid,
    input               clk, rst,
    output reg          par_bit
);

    always @(posedge clk, negedge rst) begin
        if (!rst)
            par_bit <= 0;
        else if (Data_valid)
            par_bit <= (^P_data) ^ PAR_type;
        end

endmodule