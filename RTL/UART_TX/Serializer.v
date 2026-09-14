module Serializer (
    input        [7:0] P_data,
    input               ser_en,
    input               clk, rst,
    output              ser_done,
    output reg          ser_data
);
    reg [3:0] counter;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            ser_data <= 0;
            counter  <= 0;
        end
        else if (!ser_en) begin
            ser_data <= P_data[0];     
            counter  <= 0;
        end
        else if (counter < 'd7) begin
            ser_data <= P_data[counter + 1];
            counter  <= counter + 1;
        end
            
    end
    
        assign ser_done = (counter == 'd7);
endmodule