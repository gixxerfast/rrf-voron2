; raise Z before moving if needed
if {move.axes[2].homed && (move.axes[2].userPosition < 10)}
  G91
  G1 Z10 F9000
  G90

; move to front at high position
G1 X150 Y20 Z150 F6000

M291 P"Remove heatblock sock" R"Noozle Clean" S2

G10 P0 S240
M291 P"Please wait while the nozzle is being heated up" R"Noozle Clean" T5	; Display message
M116 																		; Wait for the temperatures to be reached
M98 P"/macros/beep.g"
M98 P"/macros/beep.g"

M291 P"Manually clean noozle" R"Noozle Clean" S2
G10 S0 																		; Turn off the heater again
M291 P"Please re-install heatblock sock" R"Noozle Clean" S2

