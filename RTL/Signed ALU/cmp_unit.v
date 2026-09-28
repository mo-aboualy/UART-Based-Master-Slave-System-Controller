module cmp_unit #(parameter width = 8 , parameter cmp_width = 2) (
    input      signed [width-1:0]     a, b,
    input             [1:0]           alu_fun,
    input                             cmp_en,
    input                             clk, rst,
    output reg        [cmp_width-1:0] cmp_out,
    output reg                        ALU_Valid
);
    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            cmp_out  <= 'b0;
            ALU_Valid <= 0;
        end
        else begin
            if (cmp_en) begin
                case (alu_fun)
                    2'b00: begin
                        cmp_out  <= 0;
                        ALU_Valid  <= 1;
                    end
                    2'b01: begin
                        cmp_out  <= a == b;
                        ALU_Valid <= 1;
                    end
                    2'b10: begin
                        cmp_out  <= a > b ? 'd2 : 'd0;
                        ALU_Valid  <= 1;
                    end
                    2'b11: begin
                        cmp_out  <= a < b ? 'd3 : 'd0;
                        ALU_Valid  <= 1;
                    end
                endcase
            end
            else begin
                cmp_out  <= 'b0;
                ALU_Valid  <= 0;
            end
        end
    end
endmodule