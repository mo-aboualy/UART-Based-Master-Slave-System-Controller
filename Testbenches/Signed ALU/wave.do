onerror {resume}
quietly WaveActivateNextPane {} 0

# --- Clock & Reset ---
add wave -noupdate -divider {Control & Clock}
add wave -noupdate -format Logic -radix binary /alu_top_tb/clk
add wave -noupdate -format Logic -radix binary /alu_top_tb/rst

# --- Top Level Inputs ---
add wave -noupdate -divider {DUT Inputs}
add wave -noupdate -radix unsigned /alu_top_tb/a
add wave -noupdate -radix unsigned /alu_top_tb/b
add wave -noupdate -radix binary /alu_top_tb/alu_fun

# --- Decoder Enables ---
add wave -noupdate -divider {Enable Signals}
add wave -noupdate -format Logic /alu_top_tb/uut/arith_en
add wave -noupdate -format Logic /alu_top_tb/uut/logic_en
add wave -noupdate -format Logic /alu_top_tb/uut/cmp_en
add wave -noupdate -format Logic /alu_top_tb/uut/shift_en

# --- Internal Unit Outputs ---
add wave -noupdate -divider {Sub-module Outputs}
add wave -noupdate -radix unsigned /alu_top_tb/uut/arith_out
add wave -noupdate -radix binary /alu_top_tb/uut/logic_out
add wave -noupdate -radix unsigned /alu_top_tb/uut/cmp_out
add wave -noupdate -radix binary /alu_top_tb/uut/shift_out

# --- Top Level Outputs ---
add wave -noupdate -divider {DUT Outputs}
add wave -noupdate -radix unsigned /alu_top_tb/ALU_OUT
add wave -noupdate -format Logic /alu_top_tb/ALU_Valid

# --- Wave Window Configurations ---
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {220 ns}