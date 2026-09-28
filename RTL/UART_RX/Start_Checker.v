module Start_Checker (
    input      sampled_bit,
    input      start_check_EN,
    input      in_start_state,
    input [5:0] prescale,
    input [4:0] edge_count,
    input      clk, rst,
    output reg START_err
);

    always @(posedge clk, negedge rst) begin
        if (!rst)
            START_err <= 0;
        else begin
            if (in_start_state && edge_count == 0)
                START_err <= 0; // Clear error flag at frame start
            else if (start_check_EN && (edge_count == prescale - 1))
                START_err <= (sampled_bit != 0); // Evaluate only after bit is sampled
        end
    end

endmodule