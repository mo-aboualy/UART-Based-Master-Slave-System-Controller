module Clock_Divider(
    input        i_ref_clk,
    input        i_clk_en,
    input        i_rst_n,
    input  [7:0] i_div_ratio,
    output       o_div_clk
);
    reg  [7:0] counter;
    wire       ClK_DIV_EN;
    reg        clk_div_reg;

    always @(posedge i_ref_clk, negedge i_rst_n) begin
        if (!i_rst_n) begin
            clk_div_reg <= 1'b0;
            counter     <= 8'd0;
        end
        else begin
            if (ClK_DIV_EN) begin
                if (counter == i_div_ratio - 1'b1) begin
                    counter     <= 8'd0;
                    clk_div_reg <= 1'b1;
                end
                else begin
                    counter <= counter + 1'b1;
                    if (counter == (i_div_ratio / 2) - 1'b1) begin
                        clk_div_reg <= 1'b0;
                    end
                end
            end
            else begin
                counter     <= 8'd0;
                clk_div_reg <= 1'b0;
            end
        end
    end

    assign o_div_clk  = ClK_DIV_EN ? clk_div_reg : i_ref_clk;
    assign ClK_DIV_EN = i_clk_en && (i_div_ratio != 0) && (i_div_ratio != 1);

endmodule