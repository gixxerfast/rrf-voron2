; bed.g
; Called to align the gantry to the bed plane via G32

M98 P"/macros/magprobe_do_QGL.g"
G28

; Restore high currents, speed & accel
M98 P"/macros/speed_printing.g"
M98 P"/macros/xy_current_high.g"
M98 P"/macros/z_current_high.g"