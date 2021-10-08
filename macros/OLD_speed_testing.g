; Sets speeds for initial testing operation

M566 X200 Y200 Z20 E2000        ; Set maximum instantaneous speed changes (mm/min)
M203 X6000 Y6000 Z600 E15000 	; Set maximum speeds (mm/min)
M201 X2000 Y2000 Z50 E1800     	; Set maximum accelerations (mm/s^2) 
M204 P1500 T2000                ; Set printing acceleration and travel accelerations