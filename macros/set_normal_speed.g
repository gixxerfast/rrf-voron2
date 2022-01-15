; Sets normal speeds and acceleration for printing operation

M566 X240 Y240 Z240 E8000        ; Set maximum instantaneous speed changes (mm/min) aka Jerk
M203 X40000 Y40000 Z3000 E15000 ; Set maximum speeds (mm/min)
M201 X5000 Y5000 Z350 E2000     ; Set maximum accelerations (mm/s^2) 
M204 P4000 T5000                ; Set printing acceleration and travel accelerations
;M201 X10000 Y10000 Z350 E2000     ; Set maximum accelerations (mm/s^2) 
;M204 P10000 T10000                ; Set printing acceleration and travel accelerations

