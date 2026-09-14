module Stop_Checker (
    input      sampled_bit,
    input      stop_check_EN,
    input      in_start_state,
    input      clk, rst,
    output reg STOP_err
);

    always @(posedge clk, negedge rst) begin
        if (!rst)
            STOP_err <= 0;
        else begin
            if (in_start_state)
                STOP_err <= 0;
            else if (stop_check_EN)
                STOP_err <= !(sampled_bit == 1);
        end
    end

endmodule