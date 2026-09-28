module decoder (
    input      [1:0] alu_fun,
    output reg       arith_en,
    output reg       logic_en,
    output reg       cmp_en,
    output reg       shift_en
);
    always @(*) begin
        arith_en = 0;
        logic_en = 0;
        cmp_en   = 0;
        shift_en = 0;
        case (alu_fun)
            2'b00: arith_en = 1;
            2'b01: logic_en = 1;
            2'b10: cmp_en   = 1;
            2'b11: shift_en = 1;
            default: ;
        endcase
    end
endmodule