module decoder (
    input      [1:0] alu_fun,
    output reg       arith_en,
    output reg       logic_en,
    output reg       cmp_en,
    output reg       shift_en
);
    always @(*) begin
        case (alu_fun)
            2'b00: begin
                arith_en = 1;
                logic_en = 0;
                cmp_en   = 0;
                shift_en = 0;
            end
            2'b01: begin
                arith_en = 0;
                logic_en = 1;
                cmp_en   = 0;
                shift_en = 0;
            end
            2'b10: begin
                arith_en = 0;
                logic_en = 0;
                cmp_en   = 1;
                shift_en = 0;
            end
            2'b11: begin
                arith_en = 0;
                logic_en = 0;
                cmp_en   = 0;
                shift_en = 1;
            end
        endcase
    end
endmodule