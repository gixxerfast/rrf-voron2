; Macro to attach the Mag probe
G90

if global.magprobe_status != "attached"
  ; approach the dock
  G1 Z15 F12000

  G90
  G1 X-4 Y265 F12000
  M400
  
  G1 X-4 Y302 F2400
  M400

  G1 X40 Y302 F4800
  M400

  G1 X80 Y285 F1200
  M400

  ; check for probe trigger here
  M98 P"/macros/magprobe_get_status.g"

  if global.magprobe_status == "attached"
    echo "Probe is attached to the tool"
  else
    echo "Error probe not attached - aborting"
    abort
  ;end if
;end if