; homez.g
; called to home the Z axis

; do nothing if XY is not homed yet
if !move.axes[0].homed || !move.axes[1].homed
    echo "XY are not homed yet. Aborting"
    abort
;end if


M98 P"/macros/magprobe_dock.g"
M98 P"/macros/set_safe_speed.g"     	; Setup low speed & accel

;echo "homing Z"
M98 P"/macros/goto_z_switch.g"		    ; Goes over the Z-Switch PIN !!!! CHECK COORDINATES CAREFULLY !!!!
M98 P"/macros/set_safe_current_z.g"      

G30 K1 Z-99999						    ; Probe the Z pin at the back

M98 P"/macros/restore_current_z.g"      ; Restore high Z currents
M98 P"/macros/set_normal_speed.g"       ; Restore normal speed & accel
G90
G1 Z10 F9000
