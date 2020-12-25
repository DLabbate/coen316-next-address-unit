# next_address_script.tcl
# TCL script for running vivado in batch mode to synthesize next_address.vhd
# Domenic Labbate
# November 28th, 2020

# To run the script first source the Vivado env file:
# source /CMC/tools/xilinx/Vivado_2018.2/Vivado/2018.2/settings64_CMC_central_license.csh
#
#Then issue the following command from the Linux prompt:
# vivado -log next_address_log.log -mode batch -source next_address_script.tcl

# read in the VHDL source code files and the xdc constraints file

# to allow for unconstrained ports
# we must set this property, this will
# generated only Warnings about unconstrained ports, but no errors
# and bitgen will generate the .bit file
# we intentionally did not specify any pin constraints in the
# .xdc file since we are not programming the board

set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

read_vhdl  { ./next_address.vhd }
read_xdc  next_address_circuit.xdc

# the -top refers to the top level VHDL entity name
# the -part specfies the target Xilinx FPGA

synth_design -top next_address -part xc7a100tcsg324-1
opt_design
place_design
route_design

# generate the bitsteam file
write_bitstream -force next_address_circuit.bit