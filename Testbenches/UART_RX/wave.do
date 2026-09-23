onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -color {Yellow} -radix binary   /UART_RX_tb/clk_tb
add wave -noupdate -color {Red}    -radix binary   /UART_RX_tb/rst_tb

add wave -noupdate -divider {Frame Configuration}
add wave -noupdate -color {Cyan}   -radix unsigned /UART_RX_tb/prescale_tb
add wave -noupdate -color {Cyan}   -radix binary   /UART_RX_tb/PAR_EN_tb
add wave -noupdate -color {Cyan}   -radix binary   /UART_RX_tb/PAR_TYPE_tb

add wave -noupdate -divider {Serial Input Line}
add wave -noupdate -color {Orange} -radix binary   /UART_RX_tb/RX_IN_tb

add wave -noupdate -divider {Parallel Output Interface}
add wave -noupdate -color {Magenta}-radix binary   /UART_RX_tb/data_valid_tb
add wave -noupdate -color {Green}  -radix hex      /UART_RX_tb/P_DATA_tb

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