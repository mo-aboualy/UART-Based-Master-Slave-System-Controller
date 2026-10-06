####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load
#
# 9. DFT case analysis

################  PARAMETERS #####################

set REF_CLK_PERIOD 20
set UART_CLK_PERIOD 271.2674
set SCAN_CLK_PERIOD 100
set SETUP_UNCERTAINTY 0.2
set HOLD_UNCERTAINTY 0.1
set CLOCK_TRANSITION 0.05
set INPUT_DELAY [expr 0.2 * $REF_CLK_PERIOD]
set OUTPUT_DELAY [expr 0.2 * $REF_CLK_PERIOD]
set SCAN_INPUT_DELAY [expr 0.2 * $SCAN_CLK_PERIOD]
set SCAN_OUTPUT_DELAY [expr 0.2 * $SCAN_CLK_PERIOD]
set OUTPUT_LOAD 0.1


####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

#1. Master Clocks

create_clock -name REF_CLK -period $REF_CLK_PERIOD [get_ports REF_CLK]

create_clock -name UART_CLK -period $UART_CLK_PERIOD [get_ports UART_CLK]

create_clock -name SCAN_CLK -period $SCAN_CLK_PERIOD [get_ports scan_clk]

#2. Generated clocks

create_generated_clock -master_clock REF_CLK -source [get_ports REF_CLK] -name ALU_CLK -divide_by 1 [get_pins Clock_Gating/Gated_CLK]

create_generated_clock -master_clock UART_CLK -source [get_ports UART_CLK] -name RX_CLK -divide_by 1 [get_pins RX_Clock_Divider/o_div_clk]

create_generated_clock -master_clock UART_CLK -source [get_ports UART_CLK] -name TX_CLK -divide_by 32 [get_pins TX_Clock_Divider/o_div_clk]


####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks REF_CLK]

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks UART_CLK]

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks SCAN_CLK]

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks ALU_CLK]

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks TX_CLK]

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks RX_CLK]

set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks REF_CLK]

set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks UART_CLK]

set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks SCAN_CLK]

set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks ALU_CLK]

set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks TX_CLK]

set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks RX_CLK]

set_clock_transition $CLOCK_TRANSITION [get_clocks REF_CLK]

set_clock_transition $CLOCK_TRANSITION [get_clocks UART_CLK]

set_clock_transition $CLOCK_TRANSITION [get_clocks SCAN_CLK]

set_dont_touch_network {REF_CLK UART_CLK SCAN_CLK ALU_CLK RX_CLK TX_CLK}

set_clock_groups -asynchronous -group {REF_CLK ALU_CLK} -group {UART_CLK RX_CLK TX_CLK} -group {SCAN_CLK}

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set_input_delay $INPUT_DELAY -clock RX_CLK [get_ports UART_RX_IN]

set_input_delay $SCAN_INPUT_DELAY -clock SCAN_CLK [get_ports {SI* SE}]

set_output_delay $OUTPUT_DELAY -clock TX_CLK [get_ports UART_TX_O]

set_output_delay $OUTPUT_DELAY -clock RX_CLK [get_ports {parity_error framing_error}]

set_output_delay $SCAN_OUTPUT_DELAY -clock SCAN_CLK [get_ports SO*]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports UART_RX_IN]

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports {SI* SE}]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load $OUTPUT_LOAD [get_ports {UART_TX_O parity_error framing_error}]

set_load $OUTPUT_LOAD [get_ports SO*]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

set_wire_load_model -name "tsmc13_wl30" -library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 8 : premapped cells ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 9 : DFT Case Analysis ####
           #########################################################
####################################################################################

# Run timing analysis using scan clock (test mode)
set_case_analysis 1 [get_port test_mode]

####################################################################################
