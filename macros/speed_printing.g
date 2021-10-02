; Sets speeds for printing operation

M566 X600 Y600 Z60 E8000        ; Set maximum instantaneous speed changes (mm/min) aka Jerk
M203 X18000 Y18000 Z3000 E15000 ; Set maximum speeds (mm/min)
M201 X5000 Y5000 Z250 E2000     ; Set maximum accelerations (mm/s^2) 
M204 P3000 T5000                ; Set printing acceleration and travel accelerations
