# ==============================================================================
# ModelSim / QuestaSim Waveform Configuration
# Module: System_Controller_tb
# ==============================================================================

onerror {resume}
quietly WaveActivateNextPane {} 0

# ------------------------------------------------------------------------------
# 1. Custom Radix Definition for FSM States
# ------------------------------------------------------------------------------
catch {radix delete fsm_states}
radix define fsm_states {
    4'b0000 "IDLE",
    4'b0001 "WR_ADDR",
    4'b0010 "WR_DATA",
    4'b0011 "RD_ADDR",
    4'b0100 "RD_WAIT",
    4'b0101 "OP_A",
    4'b0110 "OP_B",
    4'b0111 "ALU_FUNC_OP",
    4'b1000 "ALU_FUNC_NOP",
    4'b1001 "ALU_WAIT",
    4'b1010 "ALU_OUT_L",
    4'b1011 "ALU_OUT_H",
    -default hex
}

# ------------------------------------------------------------------------------
# 2. Clock & Reset
# ------------------------------------------------------------------------------
add wave -divider "=== CLOCK & RESET ==="
add wave -noupdate -color "Yellow" /System_Controller_tb/clk
add wave -noupdate -color "Red"    /System_Controller_tb/rst

# ------------------------------------------------------------------------------
# 3. FSM State Tracking
# ------------------------------------------------------------------------------
add wave -divider "=== FSM STATE TRACKING ==="
add wave -noupdate -color "Cyan"    -radix fsm_states /System_Controller_tb/DUT/current_state
add wave -noupdate -color "Magenta" -radix fsm_states /System_Controller_tb/DUT/next_state
add wave -noupdate -color "Orange"  -radix hex        /System_Controller_tb/DUT/store_address

# ------------------------------------------------------------------------------
# 4. RX Data Synchronizer Interface
# ------------------------------------------------------------------------------
add wave -divider "=== RX SYNC INTERFACE ==="
add wave -noupdate -color "White" -radix hex /System_Controller_tb/P_data_sync
add wave -noupdate -color "White"            /System_Controller_tb/data_valid_sync

# ------------------------------------------------------------------------------
# 5. Register File Interface
# ------------------------------------------------------------------------------
add wave -divider "=== REGFILE INTERFACE ==="
add wave -noupdate -color "Green"            /System_Controller_tb/WR_en
add wave -noupdate -color "Green"            /System_Controller_tb/RD_en
add wave -noupdate -color "Green" -radix hex /System_Controller_tb/ADDR
add wave -noupdate -color "Green" -radix hex /System_Controller_tb/WR_Data_regfile
add wave -noupdate -color "Green" -radix hex /System_Controller_tb/RD_Data
add wave -noupdate -color "Green"            /System_Controller_tb/RD_Valid

# ------------------------------------------------------------------------------
# 6. ALU Interface
# ------------------------------------------------------------------------------
add wave -divider "=== ALU INTERFACE ==="
add wave -noupdate -color "Blue"             /System_Controller_tb/CLK_en
add wave -noupdate -color "Blue"  -radix hex /System_Controller_tb/ALU_FUNC
add wave -noupdate -color "Blue"             /System_Controller_tb/ALU_Valid
add wave -noupdate -color "Blue"  -radix hex /System_Controller_tb/ALU_OUT

# ------------------------------------------------------------------------------
# 7. ASYNC FIFO Interface
# ------------------------------------------------------------------------------
add wave -divider "=== FIFO INTERFACE ==="
add wave -noupdate -color "Coral"            /System_Controller_tb/W_full
add wave -noupdate -color "Coral"            /System_Controller_tb/W_inc
add wave -noupdate -color "Coral" -radix hex /System_Controller_tb/WR_DATA_fifo

# ------------------------------------------------------------------------------
# 8. Waveform Display Properties
# ------------------------------------------------------------------------------
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth  230
configure wave -valuecolwidth 120
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