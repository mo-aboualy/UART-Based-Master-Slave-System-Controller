onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -color {Yellow} -radix binary /UART_TX_tb/clk_tb
add wave -noupdate -color {Red}    -radix binary /UART_TX_tb/rst_tb

add wave -noupdate -divider {Frame Configuration}
add wave -noupdate -color {Cyan}   -radix binary /UART_TX_tb/PAR_EN_tb
add wave -noupdate -color {Cyan}   -radix binary /UART_TX_tb/PAR_type_tb

add wave -noupdate -divider {Parallel Input Interface}
add wave -noupdate -color {Orange} -radix hex    /UART_TX_tb/P_data_tb
add wave -noupdate -color {Cyan}   -radix binary /UART_TX_tb/Data_valid_tb

add wave -noupdate -divider {TX Output & Status}
add wave -noupdate -color {Magenta}-radix binary /UART_TX_tb/busy_tb
add wave -noupdate -color {Green}  -radix binary /UART_TX_tb/TX_OUT_tb

TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 200
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
wave zoom full