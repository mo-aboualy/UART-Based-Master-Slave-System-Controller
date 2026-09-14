module UART_TOP (
    
    input        rst,
    // Shared protocol config
    input        PAR_EN,
    input        PAR_type,

    // TX side
    input  [7:0] TX_P_data,
    input        TX_Data_valid,
    input        TX_CLK,
    output       TX_OUT,
    output       TX_busy,

    // RX side
    input        RX_IN,
    input  [5:0] prescale,
    input        RX_CLK,
    output       RX_data_valid,
    output [7:0] RX_P_DATA
);

    UART_TX_top TX_INST (
        .P_data     (TX_P_data),
        .Data_valid (TX_Data_valid),
        .PAR_EN     (PAR_EN),
        .PAR_type   (PAR_type),
        .clk        (TX_CLK),
        .rst        (rst),
        .TX_OUT     (TX_OUT),
        .busy       (TX_busy)
    );

    UART_RX_top RX_INST (
        .RX_IN      (RX_IN),
        .prescale   (prescale),
        .PAR_EN     (PAR_EN),
        .PAR_TYPE   (PAR_type),
        .clk        (RX_CLK),
        .rst        (rst),
        .data_valid (RX_data_valid),
        .P_DATA     (RX_P_DATA)
    );

endmodule