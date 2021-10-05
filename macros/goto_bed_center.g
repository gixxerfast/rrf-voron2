; raise Z 5mm before moving if needed

;M98 P"/macros/magprobe_dock.g"

echo "Moving at bed center"
G90
if move.axes[2].userPosition < 5
	G1 Z5 F9000
G1 X150 Y150 F6000