module Data_Sampler (
    input        RX_IN,
    input  [5:0] prescale,
    input  [4:0] edge_count,
    input        data_sample_EN,
    input        clk, rst,
    output       sampled_bit
);

    reg [2:0] compare;
    reg [1:0] counter;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            compare <= 0;
            counter <= 0;
        end
        else begin
            if (data_sample_EN) begin
                if (edge_count == prescale/2 - 2)
                    counter <= 0;
                else if (edge_count == (prescale/2 - 1) ||
                         edge_count == (prescale/2)     ||
                         edge_count == (prescale/2 + 1)) begin
                    compare[counter] <= RX_IN;
                    counter          <= counter + 1;
                end
            end
        end
    end

    assign sampled_bit = (compare[0] & compare[1]) |
                          (compare[0] & compare[2]) |
                          (compare[1] & compare[2]);

endmodule