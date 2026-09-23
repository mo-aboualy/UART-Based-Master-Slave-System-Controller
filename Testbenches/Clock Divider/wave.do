onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -color {Yellow} -radix binary   /Clock_Divider_tb/i_ref_clk_tb
add wave -noupdate -color {Red}    -radix binary   /Clock_Divider_tb/i_rst_n_tb

add wave -noupdate -divider {Configuration & Controls}
add wave -noupdate -color {Cyan}   -radix binary   /Clock_Divider_tb/i_clk_en_tb
add wave -noupdate -color {Orange} -radix unsigned /Clock_Divider_tb/i_div_ratio_tb

add wave -noupdate -divider {Divided Clock Output}
add wave -noupdate -color {Green}  -radix binary   /Clock_Divider_tb/o_div_clk_tb

TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 220
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