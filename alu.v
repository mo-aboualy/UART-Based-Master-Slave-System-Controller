module alu(
input [15:0] a,b,
input [3:0] alu_fun,
input clk,
output reg [15:0] alu_out,
output reg carry_flag,arith_flag,logic_flag,
output reg cmp_flag,shift_flag
    );
    always @(posedge clk)
begin
    carry_flag <= 1'b0;
    case (alu_fun)
        4'b0000: {carry_flag, alu_out} <= {1'b0,a} + {1'b0,b};
        4'b0001: {carry_flag, alu_out} <= {1'b0,a} - {1'b0,b};
        4'b0010: alu_out <= a * b;
        4'b0011: alu_out <= a / b;
        4'b0100: alu_out <= a & b;
        4'b0101: alu_out <= a | b;
        4'b0110: alu_out <= ~(a & b);
        4'b0111: alu_out <= ~(a | b);
        4'b1000: alu_out <= a ^ b;
        4'b1001: alu_out <= ~(a ^ b);
        4'b1010: alu_out <= (a == b);
        4'b1011: alu_out <= (a > b)  ? 16'd2 : 16'd0;
        4'b1100: alu_out <= (a < b)  ? 16'd3 : 16'd0;
        4'b1101: alu_out <= a >> 1;
        4'b1110: alu_out <= a << 1;
        default: alu_out <= 16'b0;
    endcase
end
    always @(*)
begin
    if(alu_fun <= 2'd3)
    begin
    arith_flag=1;
    logic_flag=0;
    cmp_flag=0;
    shift_flag=0;
    end
    else if(alu_fun < 4'b1010 && alu_fun > 4'b0011)
    begin
    logic_flag=1;
    arith_flag=0;
    cmp_flag=0;
    shift_flag=0;
    end
    else if(alu_fun < 4'b1101 && alu_fun > 4'b1001)
    begin
    cmp_flag=1;
    arith_flag=0;
    logic_flag=0;
    shift_flag=0;
    end
    else if(alu_fun == 4'b1110 || alu_fun == 4'b1101)
    begin
    shift_flag=1;
    arith_flag=0;
    cmp_flag=0;
    logic_flag=0;
    end
    else
    begin
    shift_flag=0;
    arith_flag=0;
    cmp_flag=0;
    logic_flag=0;
    end
end
endmodule