;##################################################################
; AutoZ - Automatic probe offset adjustment
;
; to use autoz, please place the following near the end
; of your slicer start gcode
; M98 P"/macros/autoz/autoz.g" <<< Place in slicer
;##################################################################


;##################################################################
; prepare
;##################################################################

M98 P"/macros/autoz/autoz_settings.g"        ; Load your settings
M98 P"/macros/autoz/scripts/autoz_globals.g" ; Load autoz framework
G29 S2                                       ; Disable mesh
M290 R0 S0                                   ; Reset baby stepping

;##################################################################
; Probe the nozzle on teh Z-pin
;##################################################################

M98 P"/macros/autoz/scripts/autoz_move_up.g" ; large z hop incase the nozzle is low and you have a high pin
M400
M98 P"/macros/autoz/scripts/autoz_goto_zpin.g" ; go to the z pin
M400
M98 P"/macros/autoz/scripts/autoz_adjust_safe_zdrive.g" ; set z drive safe physics
M400
M98 P"/macros/autoz/scripts/autoz_probe.g" K1 H5 A4 S0.003
M400

if !exists(global.macro_call_result)
  echo "Call to macro failed. Aborting"
  abort
;end if

var nozzle_height = {global.macro_call_result}
echo "nozzle_height: ", {var.nozzle_height}

M98 P"/macros/autoz/scripts/autoz_restore_zdrive.g" ; restore the z drive to the state before autoz
M400
M98 P"/macros/autoz/scripts/autoz_move_up_small.g"  ; move up 2mm
M400

;##################################################################
; Load the magprobe
;##################################################################

M98 P"/macros/autoz/scripts/autoz_move_up.g"
M400
M98 P"/macros/magprobe_attach.g"                               ; pick up and verify clicky
M400
M98 P"/macros/autoz/scripts/autoz_goto_zpin_magprobe_offset.g" ; move the clicky probe switch body over the z pin
M400
M98 P"/macros/autoz/scripts/autoz_adjust_safe_zdrive.g"        ; set z drive safe physics
M400

;##################################################################
; Probe magprobe body on the Z-pin
;##################################################################

M98 P"/macros/autoz/scripts/autoz_probe.g" K1 H5 A4 S0.003
M400

if !exists(global.macro_call_result)
  echo "Call to macro failed. Aborting"
  abort
;end if

var mag_probe_height = {global.macro_call_result}
echo "mag_probe_height: ", {var.mag_probe_height}

;##################################################################
; Probe the bed
;##################################################################

M98 P"/macros/autoz/scripts/autoz_move_up.g"        ; hop to clear the switch
M400
M98 P"/macros/autoz/scripts/autoz_goto_bedcenter.g" ; go to the center of the bed 
M400

M98 P"/macros/autoz/scripts/autoz_probe.g" K0 H5 A4 S0.003
M400

if !exists(global.macro_call_result)
  echo "Call to macro failed. Aborting"
  abort
;end if

var bed_height = {global.macro_call_result}
echo "bed_height: ", {var.bed_height}

;##################################################################
; Calculate probe offset
;##################################################################

var nozzle_switch_offset = {var.mag_probe_height - var.nozzle_height + global.switch_offset}
echo "nozzle_switch_offset: ", {var.nozzle_switch_offset}

var probe_offset = {var.bed_height - var.nozzle_switch_offset}
echo "probe_offset: ", {var.probe_offset}

;##################################################################
; Set probe offset as baby step offset
;##################################################################

M290 R0 S{var.probe_offset} 
M400

;##############################################
; Finish up
;##############################################

M98 P"/macros/autoz/scripts/autoz_restore_zdrive.g" ; restore the z drive to the state before autoz
M98 P"/macros/autoz/scripts/autoz_move_up.g" ; small z hop
M400
M98 P"/macros/magprobe_dock.g" ; unload the clicky probe
M98 P"/macros/autoz/scripts/autoz_goto_bedcenter.g" ; go to the center of the bed 

;##############################################
; Done
;##############################################
