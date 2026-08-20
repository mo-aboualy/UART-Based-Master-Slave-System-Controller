module MUX (
    input        [1:0] mux_sel,
    input               ser_data,
    input               par_bit,
    output reg          TX_OUT
);

    always @(*) begin
        case (mux_sel)
            'b00 : TX_OUT = 0;         // start bit
            'b01 : TX_OUT = ser_data;  // data bits
            'b10 : TX_OUT = par_bit;   // parity bit
            'b11 : TX_OUT = 1;         // stop bit 
        endcase
    end

endmodule