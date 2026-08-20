module FSM (
    input        Data_valid,
    input        PAR_EN,
    input        ser_done,
    input        clk, rst,
    output reg [1:0] mux_sel,
    output reg       busy,
    output reg       ser_en
);

    localparam Idle   = 3'b000,
               Start  = 3'b001,
               Data   = 3'b010,
               Parity = 3'b011,
               Stop   = 3'b100;

    reg [2:0] current_state;
    reg [2:0] next_state;

    always @(posedge clk, negedge rst) begin
        if (!rst)
            current_state <= 0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            Idle : begin
                if (Data_valid)
                    next_state = Start;
                else
                    next_state = Idle;
            end

            Start : next_state = Data;

            Data : begin
                if (!ser_done)
                    next_state = Data;
                else if (PAR_EN)
                    next_state = Parity;
                else
                    next_state = Stop;
            end

            Parity : next_state = Stop;

            Stop : next_state = Idle;

            default : next_state = Idle;
        endcase
    end

    always @(*) begin
        ser_en = 0;

        case (current_state)
            Idle : begin
                busy    = 0;
                mux_sel = 'b11;  // it will make TX_OUT = Stop_bit which means TX_OUT high as intended
            end

            Start : begin
                busy    = 1;
                mux_sel = 'b00;
            end

            Data : begin
                busy    = 1;
                mux_sel = 'b01;
                ser_en  = 1;
            end

            Parity : begin
                busy    = 1;
                mux_sel = 'b10;
            end

            Stop : begin
                busy    = 1;
                mux_sel = 'b11;
            end

            default : begin
                ser_en  = 0;
                busy    = 0;
                mux_sel = 0;
            end
        endcase
    end

endmodule