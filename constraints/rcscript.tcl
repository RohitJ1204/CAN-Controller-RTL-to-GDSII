set_db / .init_lib_search_path {/home/install/FOUNDRY/digital/90nm/dig/lib}
# Read Lib,RTL and SDC files
set_db / .library "slow.lib"
set DESIGN CAN_Controller
read_hdl "CAN_Controller.v"
elaborate $DESIGN 
check_design -unresolved
read_sdc constraints_top.sdc
#Setting effort medium
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic 
syn_map
syn_opt
write_hdl>CAN_Controller_netlist.v
write_sdc>CAN_Controller_sdc.sdc
#PPA Reports
report_power > CAN_Controller_power.rpt
report_gates > CAN_Controller_gatescc.rpt
report_timing > CAN_Controller_timing.rpt
report_area > CAN_Controller_area.rpt
gui_show


