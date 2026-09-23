onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {System Clocks & Reset}
add wave -noupdate -color {Yellow} -radix binary   /UART_TOP_tb/TX_CLK
add wave -noupdate -color {Yellow} -radix binary   /UART_TOP_tb/RX_CLK
add wave -noupdate -color {Red}    -radix binary   /UART_TOP_tb/rst

add wave -noupdate -divider {Configuration}
add wave -noupdate -color {Cyan}   -radix unsigned /UART_TOP_tb/prescale
add wave -noupdate -color {Cyan}   -radix binary   /UART_TOP_tb/PAR_EN
add wave -noupdate -color {Cyan}   -radix binary   /UART_TOP_tb/PAR_type

add wave -noupdate -divider {TX Interface}
add wave -noupdate -color {Orange} -radix hex      /UART_TOP_tb/TX_P_data
add wave -noupdate -color {Cyan}   -radix binary   /UART_TOP_tb/TX_Data_valid
add wave -noupdate -color {Magenta}-radix binary   /UART_TOP_tb/TX_busy
add wave -noupdate -color {Yellow} -radix binary   /UART_TOP_tb/TX_OUT

add wave -noupdate -divider {Serial Loopback Line}
add wave -noupdate -color {White}  -radix binary   /UART_TOP_tb/RX_IN

add wave -noupdate -divider {RX Interface}
add wave -noupdate -color {Magenta}-radix binary   /UART_TOP_tb/RX_data_valid
add wave -noupdate -color {Green}  -radix hex      /UART_TOP_tb/RX_P_DATA

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