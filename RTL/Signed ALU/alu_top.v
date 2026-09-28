module alu_top #(
    parameter width     = 8, 
    parameter cmp_width = 2
) (
    input  [width-1:0]     a, b,
    input  [3:0]           alu_fun,
    input                  clk, rst,

    output reg [2*width-1:0] ALU_OUT,
    output reg               ALU_Valid
);

    wire arith_en, logic_en, cmp_en, shift_en;
    
    // Internal output wires for each unit
    wire [2*width-1:0]   arith_out;
    wire [width-1:0]     logic_out;
    wire [cmp_width-1:0] cmp_out;
    wire [width:0]       shift_out;
    
    wire arith_valid, logic_valid, cmp_valid, shift_valid;

    decoder u0 (
        .alu_fun  (alu_fun[3:2]),
        .arith_en (arith_en),
        .logic_en (logic_en),
        .cmp_en   (cmp_en),
        .shift_en (shift_en)
    );

    arithmetic_unit #(.width(width)) u1 (
        .a          (a),
        .b          (b),
        .alu_fun    (alu_fun[1:0]),
        .arith_en   (arith_en),
        .clk        (clk),
        .rst        (rst),
        .arith_out  (arith_out),
        .ALU_Valid  (arith_valid)
    );

    logic_unit #(.width(width)) u2 (
        .a          (a),
        .b          (b),
        .alu_fun    (alu_fun[1:0]),
        .logic_en   (logic_en),
        .clk        (clk),
        .rst        (rst),
        .logic_out  (logic_out),
        .ALU_Valid  (logic_valid)
    );

    cmp_unit #(.width(width), .cmp_width(cmp_width)) u3 (
        .a          (a),
        .b          (b),
        .alu_fun    (alu_fun[1:0]),
        .cmp_en     (cmp_en),
        .clk        (clk),
        .rst        (rst),
        .cmp_out    (cmp_out),
        .ALU_Valid  (cmp_valid)
    );

    shift_unit #(.width(width)) u4 (
        .a          (a),
        .b          (b),
        .alu_fun    (alu_fun[1:0]),
        .shift_en   (shift_en),
        .clk        (clk),
        .rst        (rst),
        .shift_out  (shift_out),
        .ALU_Valid  (shift_valid)
    );

    // Multiplexer for final ALU Output and Valid signal
    always @(*) begin
        case (alu_fun[3:2])
            2'b00: begin
                ALU_OUT   = arith_out;
                ALU_Valid = arith_valid;
            end
            2'b01: begin
                ALU_OUT   = {{(width){1'b0}}, logic_out};
                ALU_Valid = logic_valid;
            end
            2'b10: begin
                ALU_OUT   = {{(2*width-cmp_width){1'b0}}, cmp_out};
                ALU_Valid = cmp_valid;
            end
            2'b11: begin
                ALU_OUT   = {{(2*width-(width+1)){1'b0}}, shift_out};
                ALU_Valid = shift_valid;
            end
            default: begin
                ALU_OUT   = 'b0;
                ALU_Valid = 1'b0;
            end
        endcase
    end

endmodule