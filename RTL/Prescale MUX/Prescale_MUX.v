module Prescale_MUX (
    input  wire [5:0] prescale,
    output reg  [7:0] Div_ratio
);

    always @(*) begin
        case (prescale)
            6'b1000_00: Div_ratio = 'd1;
            6'b0100_00: Div_ratio = 'd2;
            6'b0010_00: Div_ratio = 'd4;
            6'b0001_00: Div_ratio = 'd8;
            default:    Div_ratio = 'd1;
        endcase
    end

endmodule