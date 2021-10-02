M98 P"/macros/magprobe_dock.g"

; go to bucket if Z is homed
if move.axes[2].homed
	;G90			; absolute position
	;G1 Z10 F9000
	;G1 X280 Y308 F6000		
else
	M117 "Z need to be homed first"
