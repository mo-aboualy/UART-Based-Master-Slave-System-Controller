onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -label clk_tb -color Gold /UART_TX_top_tb/clk_tb
add wave -noupdate -label rst_tb -color Orange /UART_TX_top_tb/rst_tb

add wave -noupdate -divider {Inputs}
add wave -noupdate -label P_data_tb -radix hexadecimal /UART_TX_top_tb/P_data_tb
add wave -noupdate -label Data_valid_tb /UART_TX_top_tb/Data_valid_tb
add wave -noupdate -label PAR_EN_tb /UART_TX_top_tb/PAR_EN_tb
add wave -noupdate -label PAR_type_tb /UART_TX_top_tb/PAR_type_tb

add wave -noupdate -divider {Outputs}
add wave -noupdate -label TX_OUT_tb -color Cyan /UART_TX_top_tb/TX_OUT_tb
add wave -noupdate -label busy_tb /UART_TX_top_tb/busy_tb

add wave -noupdate -divider {FSM (U1)}
add wave -noupdate -label current_state -radix unsigned /UART_TX_top_tb/DUT/U1/current_state
add wave -noupdate -label next_state -radix unsigned /UART_TX_top_tb/DUT/U1/next_state
add wave -noupdate -label mux_sel -radix binary /UART_TX_top_tb/DUT/mux_sel
add wave -noupdate -label ser_en /UART_TX_top_tb/DUT/ser_en
add wave -noupdate -label ser_done /UART_TX_top_tb/DUT/ser_done

add wave -noupdate -divider {Datapath}
add wave -noupdate -label P_data_reg -radix hexadecimal /UART_TX_top_tb/DUT/P_data_reg
add wave -noupdate -label counter -radix unsigned /UART_TX_top_tb/DUT/U4/counter
add wave -noupdate -label ser_data /UART_TX_top_tb/DUT/ser_data
add wave -noupdate -label par_bit /UART_TX_top_tb/DUT/par_bit

add wave -noupdate -divider {Testbench status}
add wave -noupdate -label checks_tb -radix unsigned /UART_TX_top_tb/checks_tb
add wave -noupdate -label errors_tb -radix unsigned -color Red /UART_TX_top_tb/errors_tb

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 170
configure wave -valuecolwidth 70
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {300 ns}
