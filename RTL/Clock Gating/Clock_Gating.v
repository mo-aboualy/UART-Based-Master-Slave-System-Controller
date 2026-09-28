module Clock_Gating (
    input   CLK_en,
    input   clk,
    output wire Gated_CLK
);
    reg en_latch;

    // Active-low latch: updates enable state only when clk is LOW
    always @(clk or CLK_en) begin
        if (!clk) begin
            en_latch <= CLK_en;
        end
    end

    // Gated clock generation via AND gate
    assign Gated_CLK = clk & en_latch;

endmodule