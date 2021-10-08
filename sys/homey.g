; homey.g
; called to home the Y axis

M98 P"/macros/set_safe_speed.g"       ; Setup low speed & accel
M98 P"/macros/set_safe_current_xy.g"  ; Lower AB currents

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

M98 P"/macros/restore_current_xy.g"      ; Restore AB currents
M98 P"/macros/set_normal_speed.g"     ; Restore normal speed & accel
