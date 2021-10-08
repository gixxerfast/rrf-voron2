; raise Z 5mm before moving if needed

if move.axes[2].userPosition < 5
  G91				; relative position
  G1 Z5 F9000
  G90				; absolute position
G90
G1 Z60 X150 Y30