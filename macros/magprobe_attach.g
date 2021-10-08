; Macro to dock the Mag probe

if global.magprobe_status != "attached"
	; approach the dock
	G90 
	G1 Z15 F12000
	G1 Y270
	M400
	G1 X44                    ; xpos = 44
	M400
	; moves into the dock
	G1 Y305 F2400             ; ypos = 305 
	M400
	G4 P500
	; move out from dock
	G1 Y270 F2400
	M400
	G1 Y250 F12000
	; check for probe trigger here
	M98 P"/macros/magprobe_get_status.g"
	
elif global.magprobe_status == "attached"
	echo "Probe is attached to the tool"
	
else
	echo "Error probe not attached - aborting"
	abort
;end if
