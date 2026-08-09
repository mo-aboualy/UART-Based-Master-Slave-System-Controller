module auto_garage (
    input  UP_Max, activate, DN_Max,
    input  clk, rst,
    output reg UP_M, DN_M
);

    reg [1:0] current_state, next_state;

    localparam IDLE  = 2'b00,
               MV_UP = 2'b01,
               MV_DN = 2'b10;

    always @(posedge clk, negedge rst) begin
        if (!rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            IDLE: begin
                if (!activate)
                    next_state = IDLE;
                else if (activate && DN_Max && !UP_Max)
                    next_state = MV_UP;
                else if (activate && !DN_Max && UP_Max)
                    next_state = MV_DN;
                else
                    next_state = IDLE;
            end

            MV_UP: begin
                if (UP_Max)
                    next_state = IDLE;
                else
                    next_state = MV_UP;
            end

            MV_DN: begin
                if (DN_Max)
                    next_state = IDLE;
                else
                    next_state = MV_DN;
            end

            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        case (current_state)
            IDLE: begin
                UP_M = 0;
                DN_M = 0;
            end

            MV_UP: begin
                UP_M = 1;
                DN_M = 0;
            end

            MV_DN: begin
                UP_M = 0;
                DN_M = 1;
            end

            default: begin
                UP_M = 0;
                DN_M = 0;
            end
        endcase
    end

endmodule