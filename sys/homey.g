; homey.g
; called to home the Y axis

; Setup low speed & accel
M98 P"/macros/speed_probing.g"

; Lower AB currents
M98 P"/macros/xy_current_low.g"

if !move.axes[0].homed
	; raise Z a bit
	G91
	G1 H2 Z5 
	G90

; reset current position to 0
G92 Y0

; Move quickly to Y axis endstop and stop there (first pass)
G1 Y320 F3600 H1

; Go back a few mm
G91
G1 Y-5 F9000
G90

; Move slowly to Y axis endstop once more (second pass)
G1 Y340 F360 H1

; Restore AB currents
M98 P"/macros/xy_current_high.g"

; Restore normal speed & accel
M98 P"/macros/speed_printing.g"
