module Start_Checker (
    input      sampled_bit,
    input      start_check_EN,
    input      clk, rst,
    output reg START_err
);

    always @(posedge clk, negedge rst) begin
        if (!rst)
            START_err <= 0;
        else begin
            if (start_check_EN)
                START_err <= !(sampled_bit == 0);
        end
    end

endmodule