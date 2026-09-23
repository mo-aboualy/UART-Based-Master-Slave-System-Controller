onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -color {Yellow} -radix binary /alu_signed_tb/clk_tb
add wave -noupdate -color {Red}    -radix binary /alu_signed_tb/rst_tb

add wave -noupdate -divider {Control & Operand Inputs}
add wave -noupdate -color {Cyan}   -radix binary  /alu_signed_tb/alu_fun_tb
add wave -noupdate -color {Orange} -radix decimal /alu_signed_tb/a_tb
add wave -noupdate -color {Orange} -radix decimal /alu_signed_tb/b_tb

add wave -noupdate -divider {Arithmetic Stage}
add wave -noupdate -color {Green}  -radix decimal /alu_signed_tb/arith_out_tb
add wave -noupdate -color {White}  -radix binary  /alu_signed_tb/arith_flag_tb

add wave -noupdate -divider {Logic Stage}
add wave -noupdate -color {Green}  -radix hex     /alu_signed_tb/logic_out_tb
add wave -noupdate -color {White}  -radix binary  /alu_signed_tb/logic_flag_tb

add wave -noupdate -divider {Comparator Stage}
add wave -noupdate -color {Green}  -radix unsigned /alu_signed_tb/cmp_out_tb
add wave -noupdate -color {White}  -radix binary   /alu_signed_tb/cmp_flag_tb

add wave -noupdate -divider {Shifter Stage}
add wave -noupdate -color {Green}  -radix hex     /alu_signed_tb/shift_out_tb
add wave -noupdate -color {White}  -radix binary  /alu_signed_tb/shift_flag_tb

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
configure wave -timelineunits us
update
wave zoom full