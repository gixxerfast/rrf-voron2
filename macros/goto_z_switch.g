if move.axes[2].homed
	G90					; absolute position
	G1 Z5 F9000			; move Z to 5mm before moving
	G1 X205 Y305 F6000	; move over the Z-Switch (left side)
	G1 Z2
else					
; if Z is not homed it is not possible to know the current Z
	G90					; absolute position
	G1 X205 Y305 F6000	; move over the Z-Switch