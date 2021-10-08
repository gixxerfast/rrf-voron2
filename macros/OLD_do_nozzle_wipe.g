; assumes we are homed 

; WITHOUT SCRUBBER INSTALLED

; draws two lines at the left side border of the plate
;G1 X5 Y30 Z1 F5000 			; move z up little to prevent scratching of surface
;G92 E0 ; reset extruder
;G1 X2 Y30 Z0.3 F5000.0 		; move to start-line position
;G1 X2 Y295.0 Z0.3 F1500.0 E18 	; draw 1st line
;G1 X4 Y295.0 Z0.2 F5000.0 		; move to side a little
;G1 X4 Y30 Z0.2 F1500.0	 		; draw 2nd line
;G1 E-0.05 F3600 				; quick retract
;G1 X6 Y30 Z1 F1500				; moves aside a bit	
;G1 X6 Y290 Z1 F1500.0 			; wiping move
;G92 E0 ; reset extruder
;G1 X150 Y290 Z5				; moves at back center

; WITH SCRUBBER INSTALLED

echo "Moving to bucket"
M98 P"/macros/goto_bucket.g"
G92 E0 ; reset extruder
M98 P"/macros/do_nozzle_scrub.g"
G90 							; absolute