; do a single probe on the Z switch, finalizing the Z height
M98 P"/macros/print_scripts/z_current_low.g"
if move.axes[2].userPosition < 5
	G1 Z5
M98 P"/macros/print_scripts/goto_z_switch.g"
G30 K1 Z-99999
M98 P"/macros/print_scripts/z_current_high.g"
