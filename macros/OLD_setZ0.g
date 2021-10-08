if !move.axes[2].homed
	M117 "Z need to be homed first"
	abort
	
M98 P"/macros/magprobe_dock.g"	

M98 P"/macros/goto_z_switch.g"		; Goes over the Z-Swithc PIN !!!! CHECK COORDINATES CAREFULLY !!!!
M98 P"/macros/speed_probing.g"      ; Setup low speed & accel
G90
G1 Z2
G30 K1 Z-99999                      ; Probe the Z pin at the back  K1 is the second probe defined 
G1 Z10
M98 P"/macros/z_current_high.g"     ; Restore high Z currents
M98 P"/macros/set_normal_speed.g"     ; Restore normal speed & accel