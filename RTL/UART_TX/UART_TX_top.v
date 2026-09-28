module UART_TX_top (
    input  [7:0] P_data,
    input        Data_valid,
    input        PAR_EN,
    input        PAR_type,
    input        clk,
    input        rst,
    output       TX_OUT,
    output       busy
);

    wire       ser_done, ser_en;
    wire       par_bit;
    wire       ser_data;
    wire [1:0] mux_sel;

    // Hold the byte for the whole frame: the FIFO read pointer advances (R_inc)
    // while the frame is still being serialized.
    reg [7:0] P_data_reg;
    always @(posedge clk, negedge rst) begin
        if (!rst)                        P_data_reg <= 8'b0;
        else if (Data_valid && !busy)    P_data_reg <= P_data;
    end

    FSM U1 (
        .Data_valid (Data_valid),
        .PAR_EN     (PAR_EN),
        .ser_done   (ser_done),
        .clk        (clk),
        .rst        (rst),
        .mux_sel    (mux_sel),
        .busy       (busy),
        .ser_en     (ser_en)
    );

    MUX U2 (
        .mux_sel  (mux_sel),
        .ser_data (ser_data),
        .par_bit  (par_bit),
        .TX_OUT   (TX_OUT)
    );

    Parity_Calculator U3 (
        .P_data     (P_data_reg),
        .PAR_type   (PAR_type),
        .Data_valid (Data_valid),
        .clk        (clk),
        .rst        (rst),
        .par_bit    (par_bit)
    );

    Serializer U4 (
        .P_data   (P_data_reg),
        .ser_en   (ser_en),
        .clk      (clk),
        .rst      (rst),
        .ser_done (ser_done),
        .ser_data (ser_data)
    );

endmodule