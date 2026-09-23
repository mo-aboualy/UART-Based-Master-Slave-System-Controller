onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -color {Yellow} -radix binary   /register_file_tb/clk_tb
add wave -noupdate -color {Red}    -radix binary   /register_file_tb/rst_tb

add wave -noupdate -divider {Access Control & Address}
add wave -noupdate -color {Cyan}   -radix binary   /register_file_tb/WR_en_tb
add wave -noupdate -color {Cyan}   -radix binary   /register_file_tb/RD_en_tb
add wave -noupdate -color {Orange} -radix unsigned /register_file_tb/address_tb

add wave -noupdate -divider {Data Ports}
add wave -noupdate -color {Orange} -radix hex      /register_file_tb/wrdata_tb
add wave -noupdate -color {Green}  -radix hex      /register_file_tb/RDdata_tb

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
configure wave -timelineunits us
update
wave zoom full