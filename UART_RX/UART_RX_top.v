module UART_RX_top (
    input        RX_IN,
    input  [5:0] prescale,
    input        PAR_EN,
    input        PAR_TYPE,
    input        clk, rst,
    output       data_valid,
    output [7:0] P_DATA
);

    wire        sampled_bit, data_sample_EN;
    wire [4:0]  edge_count;
    wire [3:0]  bit_count;
    wire        edge_bit_EN, deser_EN, in_data_state, in_start_state;
    wire        start_check_EN, parity_check_EN, stop_check_EN;
    wire        PAR_err, STOP_err, START_err;

    FSM U0 (
        .RX_IN(RX_IN),
        .prescale(prescale),
        .PAR_EN(PAR_EN),
        .edge_count(edge_count),
        .bit_count(bit_count),
        .PAR_err(PAR_err),
        .STOP_err(STOP_err),
        .START_err(START_err),
        .clk(clk),
        .rst(rst),
        .data_valid(data_valid),
        .edge_bit_EN(edge_bit_EN),
        .data_sample_EN(data_sample_EN),
        .deser_EN(deser_EN),
        .in_data_state(in_data_state),
        .in_start_state(in_start_state),
        .start_check_EN(start_check_EN),
        .parity_check_EN(parity_check_EN),
        .stop_check_EN(stop_check_EN)
    );

    Edge_Bit_Counter U1 (
        .edge_bit_EN(edge_bit_EN),
        .in_data_state(in_data_state),
        .in_start_state(in_start_state),
        .prescale(prescale),
        .clk(clk),
        .rst(rst),
        .edge_count(edge_count),
        .bit_count(bit_count)
    );

    Data_Sampler U2 (
        .RX_IN(RX_IN),
        .prescale(prescale),
        .edge_count(edge_count),
        .data_sample_EN(data_sample_EN),
        .clk(clk),
        .rst(rst),
        .sampled_bit(sampled_bit)
    );

    Deserializer U3 (
        .sampled_bit(sampled_bit),
        .deser_EN(deser_EN),
        .in_start_state(in_start_state),
        .clk(clk),
        .rst(rst),
        .P_DATA(P_DATA)
    );

    Start_Checker U4 (
        .sampled_bit(sampled_bit),
        .start_check_EN(start_check_EN),
        .clk(clk),
        .rst(rst),
        .START_err(START_err)
    );

    Parity_Checker U5 (
        .sampled_bit(sampled_bit),
        .parity_check_EN(parity_check_EN),
        .PAR_TYPE(PAR_TYPE),
        .P_DATA(P_DATA),
        .in_start_state(in_start_state),
        .clk(clk),
        .rst(rst),
        .PAR_err(PAR_err)
    );

    Stop_Checker U6 (
        .sampled_bit(sampled_bit),
        .stop_check_EN(stop_check_EN),
        .in_start_state(in_start_state),
        .clk(clk),
        .rst(rst),
        .STOP_err(STOP_err)
    );

endmodule