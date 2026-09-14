module Parity_Checker (
    input             sampled_bit,
    input             parity_check_EN,
    input             PAR_TYPE,
    input       [7:0] P_DATA,
    input             in_start_state,
    input             clk, rst,
    output reg        PAR_err
);

    always @(posedge clk, negedge rst) begin
        if (!rst)
            PAR_err <= 0;
        else begin
            if (in_start_state)
                PAR_err <= 0;
            else if (parity_check_EN)
                PAR_err <= sampled_bit != ((^P_DATA) ^ PAR_TYPE);
        end
    end

endmodule