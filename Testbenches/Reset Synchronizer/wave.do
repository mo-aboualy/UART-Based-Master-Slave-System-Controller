onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Resets}
add wave -noupdate -color {Yellow} -radix binary /Reset_SYNC_tb/clk_Reset_SYNC_tb
add wave -noupdate -color {Red}    -radix binary /Reset_SYNC_tb/rst_Reset_SYNC_tb
add wave -noupdate -color {Green}  -radix binary /Reset_SYNC_tb/sync_rst_Reset_SYNC_tb

TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 230
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