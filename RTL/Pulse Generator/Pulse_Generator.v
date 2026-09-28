module Pulse_Generator (
    input  wire bus_enable,
    input  wire clk,
    input  wire rst,
    output wire enable_pulse
);
    reg [1:0] pulse_flop;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            pulse_flop <= 2'b00;
        end else begin
            // 2-stage pipeline to capture current and previous input states
            pulse_flop[0] <= bus_enable;
            pulse_flop[1] <= pulse_flop[0];
        end
    end

    // Rising edge detection: high only when current state is 1 and previous state was 0
    assign enable_pulse = pulse_flop[0] & !pulse_flop[1];

endmodule