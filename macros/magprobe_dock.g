; Macro to dock the Mag probe

if global.magprobe_status != "docked"
	echo "Docking Mag Probe"
	; approach the dock
	G90
	if move.axes[2].homed
		G1 Z15 F12000	; raise Z if homed already
	G1 Y270
	M400
	G1 X44              ; xpos = 44
	M400
	; moves into the dock
	G1 Y305 F2400       ; ypos = 305
	M400
	G4 P500
	; disengage from dock
	G1 X85 F4800
	M400
	; move out 
	G1 X120 F12000
	M400
	G1 Y270 F12000
	G1 Y250 F12000
	; check for probe trigger here
	M98 P"/macros/magprobe_get_status.g"
	;echo global.magprobe_status

if global.magprobe_status = "docked"
	echo "Probe is docked"
else
	echo "Error probe not docked - aborting"
	abort
; finish