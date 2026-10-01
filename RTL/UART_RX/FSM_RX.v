module FSM_RX (
    input        RX_IN,
    input        PAR_EN,
    input  [4:0] edge_count,
    input  [3:0] bit_count,
    input        PAR_err, STOP_err, START_err,
    input  [5:0] prescale,
    input        clk, rst,
    output reg   data_valid,
    output reg   edge_bit_EN,
    output reg   data_sample_EN,
    output reg   deser_EN,
    output reg   in_data_state, in_start_state,
    output reg   start_check_EN, parity_check_EN, stop_check_EN
);

    reg [2:0] current_state, next_state;

    localparam IDLE   = 3'b000,
               START  = 3'b001,
               DATA   = 3'b010,
               PARITY = 3'b011,
               STOP   = 3'b100;

    always @(posedge clk, negedge rst) begin
        if (!rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            IDLE: begin
                if (RX_IN)
                    next_state = IDLE;
                else
                    next_state = START;
            end
            START: begin
                if (edge_count == prescale - 1) begin
                    if (START_err)
                        next_state = IDLE;
                    else
                        next_state = DATA;
                end
                else
                    next_state = START;
            end
            DATA: begin
                if (edge_count == prescale - 1) begin
                    if (bit_count != 7)
                        next_state = DATA;
                    else if (PAR_EN)
                        next_state = PARITY;
                    else
                        next_state = STOP;
                end
                else
                    next_state = DATA;
            end
            PARITY: begin
                if (edge_count == prescale - 1)
                    next_state = STOP;
                else
                    next_state = PARITY;
            end
            STOP: begin
                if (edge_count == prescale - 1) begin
                    if (!RX_IN)
                    next_state = START; // Back-to-back frame detected
                    else
                    next_state = IDLE;  // Line is IDLE
                end
                    else
                    next_state = STOP;
            end
            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        edge_bit_EN     = 0;
        data_sample_EN  = 0;
        deser_EN        = 0;
        start_check_EN  = 0;
        parity_check_EN = 0;
        stop_check_EN   = 0;
        in_data_state   = 0;
        in_start_state  = 0;
        
        case (current_state)
            IDLE: begin
                edge_bit_EN     = !RX_IN;
                data_sample_EN  = 0;
                deser_EN        = 0;
                start_check_EN  = 0;
                parity_check_EN = 0;
                stop_check_EN   = 0;
                in_data_state   = 0;
                in_start_state  = 0;
            end
            START: begin
                edge_bit_EN    = 1;
                data_sample_EN = 1;
                start_check_EN = 1;
                in_start_state = 1;
            end
            DATA: begin
                edge_bit_EN    = 1;
                data_sample_EN = 1;
                in_data_state  = 1;
                if (edge_count == prescale - 1)
                    deser_EN = 1;
            end
            PARITY: begin
                edge_bit_EN     = 1;
                data_sample_EN  = 1;
                parity_check_EN = 1;
            end
            STOP: begin
                edge_bit_EN    = 1;
                data_sample_EN = 1;
                stop_check_EN  = 1;
            end
            default: begin
                edge_bit_EN     = 0;
                data_sample_EN  = 0;
                deser_EN        = 0;
                start_check_EN  = 0;
                parity_check_EN = 0;
                stop_check_EN   = 0;
                in_start_state  = 0;
                in_data_state   = 0;
            end
        endcase
    end

    // -------------------------------------------------------------------------
    // 4. Glitch-Free Registered CDC Output for data_valid
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            data_valid <= 1'b0;
        end else begin
            if ((current_state == STOP) && 
                (edge_count == prescale - 1) && 
                !PAR_err && !STOP_err) begin
                data_valid <= 1'b1;
            end else begin
                data_valid <= 1'b0;
            end
        end
    end

endmodule