module Clock_Gating (
    input   CLK_en,
    input   test_mode,
    input   clk,
    output wire Gated_CLK
);
/*   
 reg en_latch;

    // Active-low latch: updates enable state only when clk is LOW
    always @(clk or CLK_en) begin
        if (!clk) begin
            en_latch <= CLK_en;
        end
    end

    // Gated clock generation via AND gate
    assign Gated_CLK = clk & en_latch;
*/

TLATNCAX12M U0_TLATNCAX12M (
.E(CLK_en | test_mode),
.CK(clk),
.ECK(Gated_CLK)
);

endmodule
