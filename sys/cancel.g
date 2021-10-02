; cancel.g
; called when a print is cancelled after a pause.

M104 S0     ; turn off hotend
M140 S0		; turn off heatbed
M106 P0 S0  ; shut off blower
M106 P3 S0  ; shut off bay fans

M98 P"/macros/led_status_print_end.g"