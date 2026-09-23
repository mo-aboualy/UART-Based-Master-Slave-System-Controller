module arithmetic_unit #(parameter width = 16) (
    input      signed [width-1:0]   a, b,
    input             [1:0]         alu_fun,
    input                            arith_en,
    input                            clk, rst,
    output reg        [2*width-1:0] arith_out,
    output reg                      arith_flag
);
    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            arith_out  <= 'b0;
            arith_flag <= 0;
        end
        else begin
            if (arith_en) begin
                case (alu_fun)
                    2'b00: begin
                        arith_out  <= a + b;
                        arith_flag <= 1;
                    end
                    2'b01: begin
                        arith_out  <= a - b;
                        arith_flag <= 1;
                    end
                    2'b10: begin
                        arith_out  <= a * b;
                        arith_flag <= 1;
                    end
                    2'b11: begin
                        arith_out  <= a / b;
                        arith_flag <= 1;
                    end
                endcase
            end
            else begin
                arith_out  <= 'b0;
                arith_flag <= 0;
            end
        end
    end
endmodule