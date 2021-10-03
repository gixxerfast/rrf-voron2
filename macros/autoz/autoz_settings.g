; ---------- ---------- EDIT THESE VALUES FOR YOUR MACHINE ---------- ----------
; 
; 
; ---------- Coordinates ----------

; THIS IS THE DISTANCE FROM THE BODY OF THE CLICKY PROBE TO IT'S OWN TRIGGER POINT 
if !exists(global.switch_offset)
 global switch_offset = 0.400000 ; larger values here means nozzle closer to the bed after autoz


; THIS IS THE ABSOLUTE X LOCATION OF THE CLICKY WHILE DOCKED
if !exists(global.clickydockx)
 global clickydockx = 44


; THIS IS THE ABSOLUTE Y LOCATION OF THE CLICKY WHILE DOCKED
if !exists(global.clickydocky)
 global clickydocky = 305


; THIS IS THE RELATIVE DISTANCE AND DIRECTION OF THE CLICKY DOCKING MOVE
if !exists(global.clickywipe)
 global clickywipe = 30 ; -30 for a left wipe 30 for a right wipe


; THIS IS THE ABSOLUTE X LOCATION OF THE MECHANICAL Z PIN 
if !exists(global.zpinx)
 global zpinx = 205


; THIS IS THE ABSOLUTE Y LOCATION OF THE MECHANICAL Z PIN
if !exists(global.zpiny)
 global zpiny = 305
 

; --------- Z Drive Electrical Params ----------


; THIS IS THE DRIVE CURRENT USED DURING AUTO Z
if !exists(global.autozdrivecurrent)
 global autozdrivecurrent = 255 


; THIS IS THE MAXIMUM SPEED FOR ALL Z MOVES DURING AUTOZ
if !exists(global.autozdrivespeed)
 global autozdrivespeed = 500 


; THIS IS THE MAXIMUM ACCEL FOR ALL Z MOVES DURING AUTOZ
if !exists(global.autozdriveaccel)
 global autozdriveaccel = 2500 


; THIS IS THE MAXIMUM JERK FOR ALL Z MOVES DURING AUTOZ
if !exists(global.autozdrivejerk)
 global autozdrivejerk = 150 
