module register_file (
    input  wire [7:0] WR_Data,
    input  wire [3:0] address,
    input  wire        WR_en,
    input  wire        RD_en,
    input  wire        clk,
    input  wire        rst,
    output reg         RD_Valid,
    output reg  [7:0] RD_Data,
    output wire [7:0] REG0,
    output wire [7:0] REG1,
    output wire [7:0] REG2,
    output wire [7:0] REG3
);

    reg [7:0] reg_file [15:0];
    integer i;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            RD_Valid <= 1'b0;
            RD_Data  <= 8'b0;

            for (i = 0; i < 16; i = i + 1) begin
                if (i == 2)
                    reg_file[i] <= 8'b100000_01; // Default reset value for UART_Config
                else if (i == 3)
                    reg_file[i] <= 8'b0010_0000; // Default reset value for Division Ratio
                else
                    reg_file[i] <= 8'b0;
            end
        end else begin
            if (WR_en && !RD_en) begin
                reg_file[address] <= WR_Data;
                RD_Valid          <= 1'b0;
            end else if (RD_en && !WR_en) begin
                RD_Data  <= reg_file[address];
                RD_Valid <= 1'b1;
            end else begin
                RD_Valid <= 1; // Clear valid flag when idle or during conflict
            end
        end
    end

    assign REG0 = reg_file[0];
    assign REG1 = reg_file[1];
    assign REG2 = reg_file[2];
    assign REG3 = reg_file[3];

endmodule