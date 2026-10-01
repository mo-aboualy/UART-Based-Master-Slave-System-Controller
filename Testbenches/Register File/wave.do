onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {Clock & Reset}
add wave -noupdate -label clk_tb -color Gold /register_file_tb/clk_tb
add wave -noupdate -label rst_tb -color Orange /register_file_tb/rst_tb

add wave -noupdate -divider {Inputs}
add wave -noupdate -label address_tb -radix hexadecimal /register_file_tb/address_tb
add wave -noupdate -label WR_en_tb /register_file_tb/WR_en_tb
add wave -noupdate -label RD_en_tb /register_file_tb/RD_en_tb
add wave -noupdate -label WR_Data_tb -radix hexadecimal /register_file_tb/WR_Data_tb

add wave -noupdate -divider {Outputs}
add wave -noupdate -label RD_Data_tb -radix hexadecimal /register_file_tb/RD_Data_tb
add wave -noupdate -label RD_Valid_tb /register_file_tb/RD_Valid_tb
add wave -noupdate -label REG0_tb -radix hexadecimal /register_file_tb/REG0_tb
add wave -noupdate -label REG1_tb -radix hexadecimal /register_file_tb/REG1_tb
add wave -noupdate -label REG2_tb -radix hexadecimal /register_file_tb/REG2_tb
add wave -noupdate -label REG3_tb -radix hexadecimal /register_file_tb/REG3_tb

add wave -noupdate -divider {Testbench status}
add wave -noupdate -label checks_tb -radix unsigned /register_file_tb/checks_tb
add wave -noupdate -label errors_tb -radix unsigned -color Red /register_file_tb/errors_tb
add wave -noupdate -label model_mem_tb -radix hexadecimal /register_file_tb/model_mem_tb

add wave -noupdate -divider {DUT internals}
add wave -noupdate -label reg_file -radix hexadecimal /register_file_tb/DUT/reg_file

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 170
configure wave -valuecolwidth 70
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1000 ns}
