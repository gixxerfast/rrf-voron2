; Sets normal speeds and acceleration for printing operation

M566 X300 Y300 Z200 E8000        ; Set maximum instantaneous speed changes (mm/min) aka Jerk
M203 X40000 Y40000 Z3000 E15000 ; Set maximum speeds (mm/min)
M201 X4000 Y4000 Z350 E2000     ; Set maximum accelerations (mm/s^2) 
M204 P4000 T6000                ; Set printing acceleration and travel accelerations
