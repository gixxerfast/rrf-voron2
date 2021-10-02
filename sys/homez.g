; homez.g
; called to home the Z axis

; do nothing if XY is not homed yet
if move.axes[0].homed && move.axes[1].homed
	M98 P"/macros/magprobe_dock.g"
	M98 P"/macros/speed_probing.g"     	; Setup low speed & accel
	echo "homing Z"
	M98 P"/macros/goto_z_switch.g"		; Goes over the Z-Swithc PIN !!!! CHECK COORDINATES CAREFULLY !!!!
	M98 P"/macros/z_current_low.g"
	;echo "probing Z now"
	G30 K1 Z-99999						; Probe the Z pin at the back
	M98 P"/macros/z_current_high.g"     ; Restore high Z currents
	M98 P"/macros/speed_printing.g"     ; Restore normal speed & accel
	G90
	G1 Z10 F9000
else
	echo "XY are not homed yet. Aborting"