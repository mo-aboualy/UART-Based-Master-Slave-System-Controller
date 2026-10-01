onerror {resume}
quietly WaveActivateNextPane {} 0

# -----------------------------------------------------------------------------
# Global & Configuration Signals
# -----------------------------------------------------------------------------
add wave -noupdate -divider -height 22 {Global & Configuration}
add wave -noupdate -format Logic -radix binary        /tb_UART_RX_top/clk
add wave -noupdate -format Logic -radix binary        /tb_UART_RX_top/rst
add wave -noupdate -format Literal -radix unsigned    /tb_UART_RX_top/prescale
add wave -noupdate -format Logic -radix binary        /tb_UART_RX_top/PAR_EN
add wave -noupdate -format Logic -radix binary        /tb_UART_RX_top/PAR_TYPE

# -----------------------------------------------------------------------------
# Serial Input Line
# -----------------------------------------------------------------------------
add wave -noupdate -divider -height 22 {Serial Interface}
add wave -noupdate -format Logic -color Yellow -radix binary /tb_UART_RX_top/RX_IN

# -----------------------------------------------------------------------------
# Top Level Outputs
# -----------------------------------------------------------------------------
add wave -noupdate -divider -height 22 {Receiver Outputs}
add wave -noupdate -format Logic -color Green -radix binary  /tb_UART_RX_top/data_valid
add wave -noupdate -format Literal -color Cyan -radix hex    /tb_UART_RX_top/P_DATA
add wave -noupdate -format Logic -color Red -radix binary    /tb_UART_RX_top/PAR_err
add wave -noupdate -format Logic -color Red -radix binary    /tb_UART_RX_top/STOP_err

# -----------------------------------------------------------------------------
# FSM State & Counters
# -----------------------------------------------------------------------------
add wave -noupdate -divider -height 22 {FSM & Counters}
add wave -noupdate -format Literal -color Magenta -radix unsigned /tb_UART_RX_top/DUT/U0/current_state
add wave -noupdate -format Literal -radix unsigned                /tb_UART_RX_top/DUT/U1/edge_count
add wave -noupdate -format Literal -radix unsigned                /tb_UART_RX_top/DUT/U1/bit_count

# -----------------------------------------------------------------------------
# Sub-module Internal Sampling & Error Flags
# -----------------------------------------------------------------------------
add wave -noupdate -divider -height 22 {Internal Control & Checkers}
add wave -noupdate -format Logic -radix binary /tb_UART_RX_top/DUT/data_sample_EN
add wave -noupdate -format Logic -radix binary /tb_UART_RX_top/DUT/sampled_bit
add wave -noupdate -format Logic -radix binary /tb_UART_RX_top/DUT/deser_EN
add wave -noupdate -format Logic -color Red -radix binary /tb_UART_RX_top/DUT/START_err

# -----------------------------------------------------------------------------
# Waveform Formatting & Zoom Configuration
# -----------------------------------------------------------------------------
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1ns
configure wave -griddelta 4
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {3000 ns}