onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Global Test Control}
add wave -noupdate -color {White}  -radix binary /ASYC_FIFO_tb/start_tb

add wave -noupdate -divider {Write Domain}
add wave -noupdate -color {Yellow} -radix binary /ASYC_FIFO_tb/W_clk_tb
add wave -noupdate -color {Red}    -radix binary /ASYC_FIFO_tb/W_rst_tb
add wave -noupdate -color {Cyan}   -radix binary /ASYC_FIFO_tb/W_inc_tb
add wave -noupdate -color {Orange} -radix hex    /ASYC_FIFO_tb/W_data_tb
add wave -noupdate -color {Magenta}-radix binary /ASYC_FIFO_tb/W_full_tb

add wave -noupdate -divider {Read Domain}
add wave -noupdate -color {Yellow} -radix binary /ASYC_FIFO_tb/R_clk_tb
add wave -noupdate -color {Red}    -radix binary /ASYC_FIFO_tb/R_rst_tb
add wave -noupdate -color {Cyan}   -radix binary /ASYC_FIFO_tb/R_inc_tb
add wave -noupdate -color {Green}  -radix hex    /ASYC_FIFO_tb/R_data_tb
add wave -noupdate -color {Magenta}-radix binary /ASYC_FIFO_tb/R_empty_tb

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