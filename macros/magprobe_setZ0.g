if move.axes[2].homed
	M98 P"/macros/z_current_low.g"		; Lowers Z currents
	M98 P"/macros/speed_probing.g"      ; Setup low speed & accel
	M98 P"/macros/magprobe_attach.g"
	echo "Moving probe to bed center"
	G90
	G1 Z15
	G1 X150 Y130						; the probe is at bed center
	G1 Z8.75 F600
	M558 K0 H2 F100
	echo "Setting Z0 with MagProbe"
	G30 K0 X150 Y130 Z-9999
	G1 Z15
	M98 P"/macros/z_current_high.g"		; Restore high Z currents
	M98 P"/macros/speed_printing.g"		; Restore normal speed & accel
	M98 P"/macros/magprobe_dock.g"
else
  M117 "Z need to be homed first"