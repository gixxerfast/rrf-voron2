; macro for levelling gantry to bed with mag probe
; it DOES NOT set final z0 !

echo "Starting mag probe QGL"
M561
echo "Bed transformation cleared"

if !move.axes[0].homed || !move.axes[1].homed
    echo "Printer was not homed."
    abort
;end if

;M98 P"/macros/magprobe_attach.g"
M401

; Lower currents, speed & accel
M98 P"/macros/set_safe_speed.g"
M98 P"/macros/set_safe_current_z.g"		; reduce current to limit potential damages
;M98 P"/macros/set_safe_current_xy.g"	; reduce current to limit potential damages

; Probe the bed at 4 points
echo "Doing 1st pass. Old deviation was: " ^ move.calibration.initial.deviation
M558 K0 H8 F1000 					; increase the depth range, gets the gantry mostly level immediately
M98 P"/sys/bed_probe_points.g"

echo "Doing 2nd pass. Current deviation: " ^ move.calibration.initial.deviation
M558 K0 H4 F500 					; reduce depth range, probe slower for better repeatability
M98 P"/sys/bed_probe_points.g"
echo "Current deviation: " ^ move.calibration.initial.deviation 

M558 K0 H2 F120   					; reduce depth range, probe slower for better repeatability
while move.calibration.initial.deviation > 0.0015
	if iterations >= 4
		break
	echo "Deviation over threshold. Executing pass n." , iterations+3	
	M98 P"/sys/bed_probe_points.g"
	echo "Current deviation: " ^ move.calibration.initial.deviation
	continue
echo "Leveling complete"

; setting Z0 based on MagProbe - experimental
;M98 P"/macros/magprobe_setZ0.g"

M558 K0 H5 F600 
;M98 P"/macros/magprobe_dock.g"
M402
M98 P"/macros/restore_current_z.g"
M98 P"/macros/restore_current_xy.g"
M98 P"/macros/set_normal_speed.g"
