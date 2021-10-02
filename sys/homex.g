; homex.g
; called to home the X axis

; Setup low speed & accel
M98 P"/macros/speed_probing.g"

; Lower AB currents
M98 P"/macros/xy_current_low.g"

; reset current position to 0
G92 X0

if !move.axes[1].homed
	; raise Z a bit
	G91
	G1 H2 Z5 
	G90

; Move quickly to X axis endstop and stop there (first pass)
G91
G1 X350 F3600 H1
; Go back a few mm
;M119
G1 X-5 F9000
; Move slowly to X axis endstop once more (second pass)
G1 X40 F360 H1
;M119
G90

; Restore AB currents
M98 P"/macros/xy_current_high.g"

; Restore normal speed & accel
M98 P"/macros/speed_printing.g"
