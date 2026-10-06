# =============================================================================
# wave.do : System_TOP_tb
#   vsim -voptargs=+acc -onfinish stop work.System_TOP_tb
#   do wave.do
#   run -all
# =============================================================================
onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *

# -----------------------------------------------------------------------------
# Symbolic FSM / ALU decoding
# -----------------------------------------------------------------------------
radix define sys_state {
    4'd0  "IDLE",
    4'd1  "WR_ADDR",
    4'd2  "WR_DATA",
    4'd3  "RD_ADDR",
    4'd4  "RD_WAIT",
    4'd5  "OP_A",
    4'd6  "OP_B",
    4'd7  "ALU_FUNC_OP",
    4'd8  "ALU_FUNC_NOP",
    4'd9  "ALU_WAIT",
    4'd10 "ALU_OUT_L",
    4'd11 "ALU_OUT_H",
    -default hexadecimal
}

radix define uart_state {
    3'd0 "IDLE",
    3'd1 "START",
    3'd2 "DATA",
    3'd3 "PARITY",
    3'd4 "STOP",
    -default hexadecimal
}

radix define mux_sel {
    2'd0 "START",
    2'd1 "DATA",
    2'd2 "PARITY",
    2'd3 "STOP",
    -default hexadecimal
}

radix define alu_fun {
    4'b0000 "ADD",
    4'b0001 "SUB",
    4'b0010 "MUL",
    4'b0011 "DIV",
    4'b0100 "AND",
    4'b0101 "OR",
    4'b0110 "NAND",
    4'b0111 "NOR",
    4'b1000 "CMP_NOP",
    4'b1001 "A==B",
    4'b1010 "A>B",
    4'b1011 "A<B",
    4'b1100 "A>>1",
    4'b1101 "A<<1",
    4'b1110 "B>>1",
    4'b1111 "B<<1",
    -default hexadecimal
}

# -----------------------------------------------------------------------------
# 1. Testbench I/O
# -----------------------------------------------------------------------------
add wave -noupdate -expand -group {1 TB I/O} -color Gold      /System_TOP_tb/RST
add wave -noupdate -expand -group {1 TB I/O} -color Cyan      /System_TOP_tb/RX_IN
add wave -noupdate -expand -group {1 TB I/O} -color Green     /System_TOP_tb/TX_OUT
add wave -noupdate -expand -group {1 TB I/O} -color Red       /System_TOP_tb/PAR_err
add wave -noupdate -expand -group {1 TB I/O} -color Red       /System_TOP_tb/STOP_err

# -----------------------------------------------------------------------------
# 2. Clocks and resets
# -----------------------------------------------------------------------------
add wave -noupdate -group {2 Clocks & Resets} -color Gold      /System_TOP_tb/REF_CLK
add wave -noupdate -group {2 Clocks & Resets} -color Gold      /System_TOP_tb/UART_CLK
add wave -noupdate -group {2 Clocks & Resets} -color Orange    /System_TOP_tb/DUT/RX_CLK
add wave -noupdate -group {2 Clocks & Resets} -color Orange    /System_TOP_tb/DUT/TX_CLK
add wave -noupdate -group {2 Clocks & Resets} -color Orange    /System_TOP_tb/DUT/ALU_CLK
add wave -noupdate -group {2 Clocks & Resets} -color Magenta   /System_TOP_tb/DUT/RST_Domain_1
add wave -noupdate -group {2 Clocks & Resets} -color Magenta   /System_TOP_tb/DUT/RST_Domain_2
add wave -noupdate -group {2 Clocks & Resets} -radix hexadecimal /System_TOP_tb/DUT/UART_CONFIG
add wave -noupdate -group {2 Clocks & Resets} -radix unsigned    /System_TOP_tb/DUT/RX_DIV_Ratio
add wave -noupdate -group {2 Clocks & Resets} -radix unsigned    /System_TOP_tb/DUT/TX_DIV_Ratio

# -----------------------------------------------------------------------------
# 3. UART RX  (UART_CLK domain)
# -----------------------------------------------------------------------------
add wave -noupdate -group {3 UART RX} -color Cyan                   /System_TOP_tb/DUT/UART/RX_INST/RX_IN
add wave -noupdate -group {3 UART RX} -radix uart_state             /System_TOP_tb/DUT/UART/RX_INST/U0/current_state
add wave -noupdate -group {3 UART RX} -radix unsigned               /System_TOP_tb/DUT/UART/RX_INST/edge_count
add wave -noupdate -group {3 UART RX} -radix unsigned               /System_TOP_tb/DUT/UART/RX_INST/bit_count
add wave -noupdate -group {3 UART RX}                               /System_TOP_tb/DUT/UART/RX_INST/data_sample_EN
add wave -noupdate -group {3 UART RX} -radix binary                 /System_TOP_tb/DUT/UART/RX_INST/U2/compare
add wave -noupdate -group {3 UART RX}                               /System_TOP_tb/DUT/UART/RX_INST/sampled_bit
add wave -noupdate -group {3 UART RX}                               /System_TOP_tb/DUT/UART/RX_INST/deser_EN
add wave -noupdate -group {3 UART RX}                               /System_TOP_tb/DUT/UART/RX_INST/start_check_EN
add wave -noupdate -group {3 UART RX}                               /System_TOP_tb/DUT/UART/RX_INST/parity_check_EN
add wave -noupdate -group {3 UART RX}                               /System_TOP_tb/DUT/UART/RX_INST/stop_check_EN
add wave -noupdate -group {3 UART RX} -color Red                    /System_TOP_tb/DUT/UART/RX_INST/START_err
add wave -noupdate -group {3 UART RX} -color Red                    /System_TOP_tb/DUT/UART/RX_INST/PAR_err
add wave -noupdate -group {3 UART RX} -color Red                    /System_TOP_tb/DUT/UART/RX_INST/STOP_err
add wave -noupdate -group {3 UART RX} -radix hexadecimal -color Green /System_TOP_tb/DUT/UART/RX_INST/P_DATA
add wave -noupdate -group {3 UART RX} -color Yellow                 /System_TOP_tb/DUT/UART/RX_INST/data_valid

# -----------------------------------------------------------------------------
# 4. Clock-domain crossing : UART_CLK -> REF_CLK
# -----------------------------------------------------------------------------
add wave -noupdate -group {4 CDC RX -> SYS} -color Yellow                      /System_TOP_tb/DUT/RX_data_valid
add wave -noupdate -group {4 CDC RX -> SYS} -radix hexadecimal                 /System_TOP_tb/DUT/RX_P_DATA
add wave -noupdate -group {4 CDC RX -> SYS} -radix binary                      /System_TOP_tb/DUT/Data_Synchronizer/meta_flop
add wave -noupdate -group {4 CDC RX -> SYS}                                    /System_TOP_tb/DUT/Data_Synchronizer/mux_sel
add wave -noupdate -group {4 CDC RX -> SYS} -color Yellow                      /System_TOP_tb/DUT/RX_data_valid_synced
add wave -noupdate -group {4 CDC RX -> SYS} -radix hexadecimal -color Green    /System_TOP_tb/DUT/RX_P_DATA_synced

# -----------------------------------------------------------------------------
# 5. System controller  (REF_CLK domain)
# -----------------------------------------------------------------------------
add wave -noupdate -expand -group {5 SYS_CTRL} -radix sys_state -color Cyan    /System_TOP_tb/DUT/SYS_CTRL/current_state
add wave -noupdate -expand -group {5 SYS_CTRL} -color Yellow                   /System_TOP_tb/DUT/SYS_CTRL/data_valid_sync
add wave -noupdate -expand -group {5 SYS_CTRL} -radix hexadecimal              /System_TOP_tb/DUT/SYS_CTRL/P_data_sync
add wave -noupdate -expand -group {5 SYS_CTRL} -radix hexadecimal              /System_TOP_tb/DUT/SYS_CTRL/store_address
add wave -noupdate -expand -group {5 SYS_CTRL} -radix alu_fun                  /System_TOP_tb/DUT/SYS_CTRL/store_func
add wave -noupdate -expand -group {5 SYS_CTRL} -divider {RegFile interface}
add wave -noupdate -expand -group {5 SYS_CTRL}                                 /System_TOP_tb/DUT/SYS_CTRL/WR_en
add wave -noupdate -expand -group {5 SYS_CTRL}                                 /System_TOP_tb/DUT/SYS_CTRL/RD_en
add wave -noupdate -expand -group {5 SYS_CTRL} -radix hexadecimal              /System_TOP_tb/DUT/SYS_CTRL/ADDR
add wave -noupdate -expand -group {5 SYS_CTRL} -radix hexadecimal              /System_TOP_tb/DUT/SYS_CTRL/WR_Data_regfile
add wave -noupdate -expand -group {5 SYS_CTRL} -radix hexadecimal              /System_TOP_tb/DUT/SYS_CTRL/RD_Data
add wave -noupdate -expand -group {5 SYS_CTRL}                                 /System_TOP_tb/DUT/SYS_CTRL/RD_Valid
add wave -noupdate -expand -group {5 SYS_CTRL} -divider {ALU interface}
add wave -noupdate -expand -group {5 SYS_CTRL}                                 /System_TOP_tb/DUT/SYS_CTRL/CLK_en
add wave -noupdate -expand -group {5 SYS_CTRL} -radix alu_fun                  /System_TOP_tb/DUT/SYS_CTRL/ALU_FUNC
add wave -noupdate -expand -group {5 SYS_CTRL} -radix hexadecimal              /System_TOP_tb/DUT/SYS_CTRL/ALU_OUT
add wave -noupdate -expand -group {5 SYS_CTRL}                                 /System_TOP_tb/DUT/SYS_CTRL/ALU_Valid
add wave -noupdate -expand -group {5 SYS_CTRL} -divider {FIFO interface}
add wave -noupdate -expand -group {5 SYS_CTRL} -color Orange                   /System_TOP_tb/DUT/SYS_CTRL/W_inc
add wave -noupdate -expand -group {5 SYS_CTRL} -radix hexadecimal              /System_TOP_tb/DUT/SYS_CTRL/WR_DATA_fifo
add wave -noupdate -expand -group {5 SYS_CTRL}                                 /System_TOP_tb/DUT/SYS_CTRL/W_full

# -----------------------------------------------------------------------------
# 6. Register file
# -----------------------------------------------------------------------------
add wave -noupdate -group {6 RegFile} -radix hexadecimal    /System_TOP_tb/DUT/Register_File/address
add wave -noupdate -group {6 RegFile}                       /System_TOP_tb/DUT/Register_File/WR_en
add wave -noupdate -group {6 RegFile}                       /System_TOP_tb/DUT/Register_File/RD_en
add wave -noupdate -group {6 RegFile} -radix hexadecimal    /System_TOP_tb/DUT/Register_File/WR_Data
add wave -noupdate -group {6 RegFile} -radix hexadecimal    /System_TOP_tb/DUT/Register_File/RD_Data
add wave -noupdate -group {6 RegFile}                       /System_TOP_tb/DUT/Register_File/RD_Valid
add wave -noupdate -group {6 RegFile} -radix unsigned       /System_TOP_tb/DUT/Register_File/REG0
add wave -noupdate -group {6 RegFile} -radix unsigned       /System_TOP_tb/DUT/Register_File/REG1
add wave -noupdate -group {6 RegFile} -radix hexadecimal    /System_TOP_tb/DUT/Register_File/REG2
add wave -noupdate -group {6 RegFile} -radix unsigned       /System_TOP_tb/DUT/Register_File/REG3
add wave -noupdate -group {6 RegFile} -radix hexadecimal    /System_TOP_tb/DUT/Register_File/reg_file

# -----------------------------------------------------------------------------
# 7. ALU and clock gating
# -----------------------------------------------------------------------------
add wave -noupdate -group {7 ALU & Clock Gating} -color Orange              /System_TOP_tb/DUT/Clock_Gating/CLK_en
add wave -noupdate -group {7 ALU & Clock Gating}                            /System_TOP_tb/DUT/Clock_Gating/en_latch
add wave -noupdate -group {7 ALU & Clock Gating} -color Orange              /System_TOP_tb/DUT/Clock_Gating/Gated_CLK
add wave -noupdate -group {7 ALU & Clock Gating} -radix unsigned            /System_TOP_tb/DUT/ALU/a
add wave -noupdate -group {7 ALU & Clock Gating} -radix unsigned            /System_TOP_tb/DUT/ALU/b
add wave -noupdate -group {7 ALU & Clock Gating} -radix alu_fun             /System_TOP_tb/DUT/ALU/alu_fun
add wave -noupdate -group {7 ALU & Clock Gating}                            /System_TOP_tb/DUT/ALU/arith_en
add wave -noupdate -group {7 ALU & Clock Gating}                            /System_TOP_tb/DUT/ALU/logic_en
add wave -noupdate -group {7 ALU & Clock Gating}                            /System_TOP_tb/DUT/ALU/cmp_en
add wave -noupdate -group {7 ALU & Clock Gating}                            /System_TOP_tb/DUT/ALU/shift_en
add wave -noupdate -group {7 ALU & Clock Gating} -radix hexadecimal         /System_TOP_tb/DUT/ALU/arith_out
add wave -noupdate -group {7 ALU & Clock Gating} -radix hexadecimal         /System_TOP_tb/DUT/ALU/logic_out
add wave -noupdate -group {7 ALU & Clock Gating} -radix hexadecimal         /System_TOP_tb/DUT/ALU/cmp_out
add wave -noupdate -group {7 ALU & Clock Gating} -radix hexadecimal         /System_TOP_tb/DUT/ALU/shift_out
add wave -noupdate -group {7 ALU & Clock Gating} -radix hexadecimal -color Green /System_TOP_tb/DUT/ALU/ALU_OUT
add wave -noupdate -group {7 ALU & Clock Gating} -color Yellow              /System_TOP_tb/DUT/ALU/ALU_Valid

# -----------------------------------------------------------------------------
# 8. Async FIFO : REF_CLK (write) -> TX_CLK (read)
# -----------------------------------------------------------------------------
add wave -noupdate -group {8 Async FIFO} -divider {Write side (REF_CLK)}
add wave -noupdate -group {8 Async FIFO} -color Orange                      /System_TOP_tb/DUT/TX_FIFO/W_inc
add wave -noupdate -group {8 Async FIFO} -radix hexadecimal                 /System_TOP_tb/DUT/TX_FIFO/W_data
add wave -noupdate -group {8 Async FIFO}                                    /System_TOP_tb/DUT/TX_FIFO/W_full
add wave -noupdate -group {8 Async FIFO} -radix unsigned                    /System_TOP_tb/DUT/TX_FIFO/W_addr
add wave -noupdate -group {8 Async FIFO} -radix binary                      /System_TOP_tb/DUT/TX_FIFO/W_ptr
add wave -noupdate -group {8 Async FIFO} -radix binary                      /System_TOP_tb/DUT/TX_FIFO/SYNC_R_ptr
add wave -noupdate -group {8 Async FIFO} -divider {Read side (TX_CLK)}
add wave -noupdate -group {8 Async FIFO} -color Orange                      /System_TOP_tb/DUT/TX_FIFO/R_inc
add wave -noupdate -group {8 Async FIFO} -radix hexadecimal                 /System_TOP_tb/DUT/TX_FIFO/R_data
add wave -noupdate -group {8 Async FIFO}                                    /System_TOP_tb/DUT/TX_FIFO/R_empty
add wave -noupdate -group {8 Async FIFO} -radix unsigned                    /System_TOP_tb/DUT/TX_FIFO/R_addr
add wave -noupdate -group {8 Async FIFO} -radix binary                      /System_TOP_tb/DUT/TX_FIFO/R_ptr
add wave -noupdate -group {8 Async FIFO} -radix binary                      /System_TOP_tb/DUT/TX_FIFO/SYNC_W_ptr
add wave -noupdate -group {8 Async FIFO} -divider {Memory}
add wave -noupdate -group {8 Async FIFO} -radix hexadecimal                 /System_TOP_tb/DUT/TX_FIFO/U0/MEM

# -----------------------------------------------------------------------------
# 9. UART TX  (TX_CLK domain)
# -----------------------------------------------------------------------------
add wave -noupdate -group {9 UART TX}                                       /System_TOP_tb/DUT/UART/TX_INST/Data_valid
add wave -noupdate -group {9 UART TX} -radix hexadecimal                    /System_TOP_tb/DUT/UART/TX_INST/P_data
add wave -noupdate -group {9 UART TX} -radix hexadecimal                    /System_TOP_tb/DUT/UART/TX_INST/P_data_reg
add wave -noupdate -group {9 UART TX} -radix uart_state -color Cyan         /System_TOP_tb/DUT/UART/TX_INST/U1/current_state
add wave -noupdate -group {9 UART TX} -color Orange                         /System_TOP_tb/DUT/UART/TX_INST/busy
add wave -noupdate -group {9 UART TX} -color Orange                         /System_TOP_tb/DUT/Pulse_Generator/enable_pulse
add wave -noupdate -group {9 UART TX}                                       /System_TOP_tb/DUT/UART/TX_INST/ser_en
add wave -noupdate -group {9 UART TX}                                       /System_TOP_tb/DUT/UART/TX_INST/ser_done
add wave -noupdate -group {9 UART TX}                                       /System_TOP_tb/DUT/UART/TX_INST/ser_data
add wave -noupdate -group {9 UART TX}                                       /System_TOP_tb/DUT/UART/TX_INST/par_bit
add wave -noupdate -group {9 UART TX} -radix mux_sel                        /System_TOP_tb/DUT/UART/TX_INST/mux_sel
add wave -noupdate -group {9 UART TX} -color Green                          /System_TOP_tb/DUT/UART/TX_INST/TX_OUT

# -----------------------------------------------------------------------------
# 10. Testbench scoreboard
# -----------------------------------------------------------------------------
add wave -noupdate -group {10 Scoreboard} -radix hexadecimal /System_TOP_tb/tx_byte
add wave -noupdate -group {10 Scoreboard} -radix unsigned    /System_TOP_tb/tx_count
add wave -noupdate -group {10 Scoreboard} -radix unsigned    /System_TOP_tb/tx_checked
add wave -noupdate -group {10 Scoreboard} -radix unsigned    /System_TOP_tb/checks
add wave -noupdate -group {10 Scoreboard} -radix unsigned -color Red /System_TOP_tb/errors

# -----------------------------------------------------------------------------
# Window setup
# -----------------------------------------------------------------------------
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 280
configure wave -valuecolwidth 90
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {2500 us}
