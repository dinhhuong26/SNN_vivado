# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "NUM_AXONS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_NEURONS" -parent ${Page_0}


}

proc update_PARAM_VALUE.NUM_AXONS { PARAM_VALUE.NUM_AXONS } {
	# Procedure called to update NUM_AXONS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_AXONS { PARAM_VALUE.NUM_AXONS } {
	# Procedure called to validate NUM_AXONS
	return true
}

proc update_PARAM_VALUE.NUM_NEURONS { PARAM_VALUE.NUM_NEURONS } {
	# Procedure called to update NUM_NEURONS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_NEURONS { PARAM_VALUE.NUM_NEURONS } {
	# Procedure called to validate NUM_NEURONS
	return true
}


proc update_MODELPARAM_VALUE.NUM_AXONS { MODELPARAM_VALUE.NUM_AXONS PARAM_VALUE.NUM_AXONS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_AXONS}] ${MODELPARAM_VALUE.NUM_AXONS}
}

proc update_MODELPARAM_VALUE.NUM_NEURONS { MODELPARAM_VALUE.NUM_NEURONS PARAM_VALUE.NUM_NEURONS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_NEURONS}] ${MODELPARAM_VALUE.NUM_NEURONS}
}

