; bed.g
; Called to align the gantry to the bed plane via G32

M98 P"/macros/magprobe_do_QGL.g"
G28

; Restore high currents, speed & accel
M98 P"/macros/set_normal_speed.g"
M98 P"/macros/restore_current_xy.g"
M98 P"/macros/restore_current_z.g"