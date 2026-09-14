module Data_Sync #(
    parameter NUM_STAGES = 8,
    parameter BUS_WIDTH  = 8
)(
    input  [BUS_WIDTH-1:0]     Unsync_bus,
    input                      bus_enable,
    input                      clk,
    input                      rst,          

    output reg [BUS_WIDTH-1:0] sync_bus,
    output reg                 enable_pulse
);

    reg  [NUM_STAGES-1:0] meta_flop;   // synchronizer shift chain
    reg                   pulse_flop;  // one cycle delayed copy for flip flop chain
    wire                  mux_sel;     
    integer               i;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            meta_flop    <= 'b0;
            pulse_flop   <= 'b0;
            sync_bus     <= 'b0;
            enable_pulse <= 'b0;
        end
        else begin
            // synchronizer chain
            meta_flop[0] <= bus_enable;
            for (i = 0; i < NUM_STAGES - 1; i = i + 1)
                meta_flop[i+1] <= meta_flop[i];

          
            pulse_flop <= meta_flop[NUM_STAGES-1];

            // capture bus / register the pulse
            enable_pulse <= mux_sel;
            sync_bus     <= mux_sel ? Unsync_bus : sync_bus;
        end
    end

    assign mux_sel = meta_flop[NUM_STAGES-1] && !pulse_flop;

endmodule