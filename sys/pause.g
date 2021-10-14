; Pause macro file
M83					; relative extruder moves
G1 E-3 F2500		; retract 3mm
G91					; relative moves
G1 Z2 F5000			; raise nozzle 2mm
G90					; absolute moves
G1 X0 Y85 F5000		; move head out of the way of the print
M98 P"/macros/led/led_status_print_pause.g"
M98 P"/macros/beep.g"
G4 P200
M98 P"/macros/beep.g"
G4 P200
M98 P"/macros/beep.g"
G4 P200
M98 P"/macros/beep.g"