module register_file(
    input      [15:0] wrdata,
    input      [2:0]  address,
    input             WR_en, RD_en,
    input             clk, rst,
    output reg [15:0] RDdata
    );

    reg [15:0] reg_file [7:0];
    integer i;

    always @(posedge clk, negedge rst)
        if (!rst)
            begin
                for (i = 0; i < 8; i = i + 1)
                    reg_file[i] <= 0;
            end
        else
            begin
                if (WR_en && !RD_en)
                    reg_file[address] <= wrdata;
                else if (RD_en && !WR_en)
                    RDdata <= reg_file[address];
            end

endmodule