# Copyright (C) 1991-2008 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.


# Quartus II Version 8.1 Build 163 10/28/2008 SJ Web Edition
# File: signalprobe_qsf.tcl
# Generated on: Sun Apr 05 15:27:07 2009

# Note: This file contains a Tcl script generated from the SignalProbe Gui.
#       You can use this script to restore SignalProbes after deleting the DB
#       folder; at the command line use "quartus_cdb -t signalprobe_qsf.tcl".

package require ::quartus::chip_planner
package require ::quartus::project
project_open Report1 -revision Report1
read_netlist
set had_failure 0

