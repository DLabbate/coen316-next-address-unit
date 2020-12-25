# next_address_circuit.xdc
# XDC file for next_address.vhd

set_property  IOSTANDARD LVCMOS33  [ get_ports { rt }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { rs }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { pc }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { target_address }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { branch_type }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { pc_sel }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { next_pc }  ] ;