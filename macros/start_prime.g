; primes a bit of filament on the front border of the bed (y = 5mm)
; starts at the left and moves to the right

G1 X275 Y5 Z10 F4000 	; move to priming spot
G1 Z10.0 F900  			; move up ?? it's already there
G1 E40.0 F200  			; prime extruder
G1 X25 Y5 F4000  		; move back

; does a line close to the bed

G1 Z0.2 F1000  			; move down to begin wipe
G1 X110 E4.0 F300  		; wipe print head (extrude material while we do this)
G92 E0.0  				; reset e count
G10 ; F6000				; G10: Retract -> Retracts filament according to settings of M207 -> WHERE IS IT ???
G1 Z10.0 F900  			; move up 
