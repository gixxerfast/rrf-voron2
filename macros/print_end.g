G91								; relative positioning
M83                             ; extruder relative positioning
G1 E-5 F1000                 	; retract 5mm of filament
G1 Z1.00 X20.0 Y20.0 F20000     ; short quick move to disengage from print
G1 Z10.00  F20000               ; move Z-Axis 10mm away from part
G90                             ; absolute positioning
G1 X310 Y310 F9000              ; move close to home

M104 S0                         ; turn off hotend
M140 S0                         ; turn off heatbed
M106 P0 S0                      ; shut off blower
; M106 P3 S30                     ; reduce bay fans to ~10% - set to therm comntrolled
echo "Wenting chamber for 10 mins"
M106 P2 S150
G4 S600							; wait 10 mins
M106 P2 S0

M98 P"/macros/led_status_print_end.g"
M98 P"/macros/play_music.g"
G90
