onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -color {Yellow} -radix binary /Data_Sync_tb/clk_tb
add wave -noupdate -color {Red}    -radix binary /Data_Sync_tb/rst_tb

add wave -noupdate -divider {Unsynchronized Inputs}
add wave -noupdate -color {Cyan}   -radix binary /Data_Sync_tb/bus_enable_tb
add wave -noupdate -color {Orange} -radix hex    /Data_Sync_tb/Unsync_bus_tb

add wave -noupdate -divider {Synchronized Outputs}
add wave -noupdate -color {Magenta}-radix binary /Data_Sync_tb/enable_pulse_tb
add wave -noupdate -color {Green}  -radix hex    /Data_Sync_tb/sync_bus_tb

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