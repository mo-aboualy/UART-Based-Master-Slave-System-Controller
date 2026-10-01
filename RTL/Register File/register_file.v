module register_file #(
    parameter WIDTH      = 8,   // data width
    parameter ADDR_WIDTH = 4,   // address width (must be >= 2 so REG0..REG3 exist)
    parameter DEPTH      = 2*ADDR_WIDTH
)(
    input  wire [WIDTH-1:0]      WR_Data,
    input  wire [ADDR_WIDTH-1:0] address,
    input  wire                  WR_en,
    input  wire                  RD_en,
    input  wire                  clk,
    input  wire                  rst,          // active low
    output reg                   RD_Valid,
    output reg  [WIDTH-1:0]      RD_Data,
    output wire [WIDTH-1:0]      REG0,         // 0x0 -> ALU
    output wire [WIDTH-1:0]      REG1,         // 0x1 -> ALU
    output wire [WIDTH-1:0]      REG2,         // 0x2 -> UART config
    output wire [WIDTH-1:0]      REG3          // 0x3 -> Clock divider
);

    // Reset defaults (UART_Config and Division Ratio)
    localparam [WIDTH-1:0] REG2_RST = 8'b1000_0001;
    localparam [WIDTH-1:0] REG3_RST = 8'b0010_0000;

    reg [WIDTH-1:0] reg_file [0:DEPTH-1];
    integer i;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            RD_Valid <= 1'b0;
            RD_Data  <= {WIDTH{1'b0}};

            for (i = 0; i < DEPTH; i = i + 1) begin
                if (i == 2)
                    reg_file[i] <= REG2_RST;
                else if (i == 3)
                    reg_file[i] <= REG3_RST;
                else
                    reg_file[i] <= {WIDTH{1'b0}};
            end
        end else begin
            RD_Valid <= 1'b0;                  // default: not valid
            if (WR_en && !RD_en) begin
                reg_file[address] <= WR_Data;
            end else if (RD_en && !WR_en) begin
                RD_Data  <= reg_file[address];
                RD_Valid <= 1'b1;
            end
        end
    end

    assign REG0 = reg_file[0];
    assign REG1 = reg_file[1];
    assign REG2 = reg_file[2];
    assign REG3 = reg_file[3];

endmodule