; homex.g
; called to home the X axis

M98 P"/macros/set_safe_speed.g"        ; Setup low speed & accel
M98 P"/macros/set_safe_current_xy.g"   ; Lower AB currents

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

M98 P"/macros/restore_current_xy.g"    ; Restore AB currents
M98 P"/macros/set_normal_speed.g"   ; Restore normal speed & accel
