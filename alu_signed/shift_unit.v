module shift_unit #(parameter width = 16) (
    input      [width-1:0] a, b,
    input      [1:0]       alu_fun,
    input                   shift_en,
    input                   clk, rst,
    output reg [width:0]   shift_out,
    output reg              shift_flag
);
    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            shift_out  <= 'b0;
            shift_flag <= 0;
        end
        else begin
            if (shift_en) begin
                case (alu_fun)
                    2'b00: begin
                        shift_out  <= a >> 1;
                        shift_flag <= 1;
                    end
                    2'b01: begin
                        shift_out  <= a << 1;
                        shift_flag <= 1;
                    end
                    2'b10: begin
                        shift_out  <= b >> 1;
                        shift_flag <= 1;
                    end
                    2'b11: begin
                        shift_out  <= b << 1;
                        shift_flag <= 1;
                    end
                endcase
            end
            else begin
                shift_out  <= 'b0;
                shift_flag <= 0;
            end
        end
    end
endmodule