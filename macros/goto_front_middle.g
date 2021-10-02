; raise Z before moving if needed
if {move.axes[2].homed && (move.axes[2].userPosition < 10)}
  G91
  G1 Z10 F9000
  G90

; goto front middle
G90
G1 X150 Y10 F6000