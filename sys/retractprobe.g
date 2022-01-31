; Macro to dock the Mag probe
G90

if global.magprobe_status != "docked"
  echo "Docking Mag Probe"

  ; approach the dock
  if move.axes[2].homed
    G1 Z15 F12000	; raise Z if homed already
  ;end if

  ; pre-stage
  G1 X40 Y302 F12000
  M400
  ; Move into dock
  G1 X-4 Y302 F2400
  M400
  ; Move out of dock, leaving probe
  G1 X-4 Y255 F4800
  M400
  ; Last move away
  G1 X40 Y215 F12000
  M400
  
  ; check for probe trigger here
  M98 P"/macros/magprobe_get_status.g"

  if global.magprobe_status = "docked"
    echo "Probe is docked"
  else
    echo "Error probe not docked - aborting"
    abort
  ;end if
;end if

