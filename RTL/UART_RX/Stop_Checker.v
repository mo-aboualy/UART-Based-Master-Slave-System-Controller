module Stop_Checker (
    input      sampled_bit,
    input      stop_check_EN,
    input      in_start_state,
    input [5:0] prescale,
    input [4:0] edge_count,
    input      clk, rst,
    output reg STOP_err
);

    always @(posedge clk, negedge rst) begin
        if (!rst)
            STOP_err <= 0;
        else begin
            if (in_start_state)
                STOP_err <= 0;
            else if (stop_check_EN && (edge_count >= (prescale >> 1) + 2))
                STOP_err <= !(sampled_bit == 1);
        end
    end

endmodule