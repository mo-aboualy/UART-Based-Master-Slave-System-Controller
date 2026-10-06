
########################### Define Top Module ############################
                                                   
set top_module System_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "/home/ICer/Final_System/syn/System_TOP.svf"


set SSLIB "/home/ICer/Final_System/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/Final_System/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/Final_System/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files

read_verilog -container Ref "/home/ICer/Final_System/RTL/alu_top.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/arithmetic_unit.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/ASYC_FIFO.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Clock_Divider.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Clock_Gating.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/cmp_unit.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Data_Sampler.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Data_Sync.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/decoder.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Deserializer.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/DF_SYNC.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Edge_Bit_Counter.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/FIFO_MEM_CONTROL.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/FIFO_RD.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/FIFO_WR.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/FSM.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/FSM_RX.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/logic_unit.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/MUX.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Parity_Calculator.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Parity_Checker.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Prescale_MUX.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Pulse_Generator.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/register_file.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Reset_SYNC.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Serializer.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/shift_unit.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Start_Checker.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/Stop_Checker.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/System_Controller.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/System_TOP.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/UART_RX_top.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/UART_TOP.v"
read_verilog -container Ref "/home/ICer/Final_System/RTL/UART_TX_top.v"

## set the top Reference Design 

set_reference_design System_TOP
set_top System_TOP

######################## Implementation Container #########################

## Read Implementation technology libraries

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files

read_verilog -container Imp /home/ICer/Final_System/syn/netlists/System_TOP.v
 
## set the top Implementation Design

set_implementation_design System_TOP
set_top System_TOP

## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


#start_gui
#exit
