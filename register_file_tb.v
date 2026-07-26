`timescale 1us / 1us
module register_file_tb();

reg  [15:0] wrdata_tb;
reg  [2:0]  address_tb;
reg         WR_en_tb, RD_en_tb;
reg         clk_tb, rst_tb;
wire [15:0] RDdata_tb;

register_file DUT (
    .wrdata(wrdata_tb),
    .address(address_tb),
    .WR_en(WR_en_tb),
    .RD_en(RD_en_tb),
    .clk(clk_tb),
    .rst(rst_tb),
    .RDdata(RDdata_tb)
);

initial
begin
    $dumpfile("register_file_tb.vcd");
    $dumpvars;

    $display("%8s | %3s | %3s | %7s | %8s | %8s |",
              "TIME(us)","WR","RD","ADDR","WrData","RDdata");
    $monitor(" %8d | %1b | %1b | %7d | 0x%4h | 0x%4h |",
                  $time, WR_en_tb, RD_en_tb, address_tb, wrdata_tb, RDdata_tb);

    clk_tb = 0;
    rst_tb = 0;
    WR_en_tb = 0; RD_en_tb = 0; address_tb = 0; wrdata_tb = 0;
    #3  rst_tb = 1; 
    // write abcd in register[3]
    #10 WR_en_tb=1; RD_en_tb=0; address_tb=3; wrdata_tb=16'hABCD;
    // write 1234 in register[6]
    #10 WR_en_tb=1; RD_en_tb=0; address_tb=6; wrdata_tb=16'h1234;
    //idle case
    #10 WR_en_tb=0; RD_en_tb=0;
    // read contents of register[3]
    #10 WR_en_tb=0; RD_en_tb=1; address_tb=3;
    // read contents of register[6]
    #10 WR_en_tb=0; RD_en_tb=1; address_tb=6;
    // idle case
    #10 WR_en_tb=0; RD_en_tb=0;
    // resetting the registers
    #10 rst_tb=0;
    #4  rst_tb=1; // release the reset
    // read contents of register[3]
    #10 WR_en_tb=0; RD_en_tb=1; address_tb=3;
    #10 $finish;
end

always #5 clk_tb = ~clk_tb;

endmodule