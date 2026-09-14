module Reset_SYNC #(parameter NUM_STAGES = 2)(
    input        clk,
    input        rst,
    output wire sync_rst
);

    reg [NUM_STAGES-1:0] memory;
    integer i;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            memory <= 0;
        end else begin
            memory[0] <= 1'b1;                     
            for (i = 1; i < NUM_STAGES; i = i + 1)  
                memory[i] <= memory[i-1];
        end
    end

    assign sync_rst = memory[NUM_STAGES-1];

endmodule