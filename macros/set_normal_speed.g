; Sets normal speeds and acceleration for printing operation

M566 X600 Y600 Z300 E8000        ; Set maximum instantaneous speed changes (mm/min) aka Jerk
M203 X12000 Y12000 Z3000 E15000 ; Set maximum speeds (mm/min)
M201 X4000 Y4000 Z350 E2000     ; Set maximum accelerations (mm/s^2) 
M204 P3000 T4000                ; Set printing acceleration and travel accelerations
