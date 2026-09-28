module logic_unit #(parameter width = 8) (
    input      [width-1:0]  a, b,
    input      [1:0]        alu_fun,
    input                   logic_en,
    input                   clk, rst,
    output reg [width-1:0]  logic_out,
    output reg              ALU_Valid
);
    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            logic_out  <= 'b0;
            ALU_Valid  <= 0;
        end
        else begin
            if (logic_en) begin
                case (alu_fun)
                    2'b00: begin
                        logic_out  <= a & b;
                        ALU_Valid  <= 1;
                    end
                    2'b01: begin
                        logic_out  <= a | b;
                        ALU_Valid  <= 1;
                    end
                    2'b10: begin
                        logic_out  <= ~(a & b);
                        ALU_Valid  <= 1;
                    end
                    2'b11: begin
                        logic_out  <= ~(a | b);
                        ALU_Valid  <= 1;
                    end
                endcase
            end
            else begin
                logic_out  <= 'b0;
                ALU_Valid  <= 0;
            end
        end
    end
endmodule