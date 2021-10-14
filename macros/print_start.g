; Macro print start
; M98 P"/macros/print_start.g" S[first_layer_bed_temperature] T{first_layer_temperature[initial_extruder]}
; Gets the active temperatures set by the slicer (1st layer)
; ------------------------------------------
;	global.bed_temp			is the set active bed temp
;	global.hotend_temp		is the set active hotend temp

; Check macro parameter for first layer bed temp
if exists(param.S)
  echo "First layer bed temp: ", {param.S}, " 'C"
;end if

; Check macro parameter for first layer hotend temp
if exists(param.T)
  echo "First layer bed hotend temp: ", {param.T}, " 'C"
;end if

M98 P"/macros/get_active_temps.g"


; turns on led in print start mode
; ------------------------------------------
M98 P"/macros/led/led_status_print_start.g"

; reset baby stepping
M290 S0.00 R0

M98 P"/macros/magprobe_dock.g"

echo "Setting Bed Temperature : " , global.bed_temp , " 'C"
M140 S{global.bed_temp}
echo "Waiting for bed heating"
M190 S{global.bed_temp}
echo "Bed Temp reached"

echo "Setting HotEnd Temperature : 170C"
M104 S{global.hotend_temp}
echo "Waiting for HotEnd heating"
M109 S170
echo "HotEnd Temp reached"

G28                           ; Homeing
G32                           ; QGL
M98 P"/macros/autoz/autoz.g"  ; AutoZ correction

; sets and waits hotend temp to slicer value
; ------------------------------------------
echo "Setting HotEnd Temperature : " , global.hotend_temp , " 'C"
M104 S{global.hotend_temp}
echo "Waiting for HotEnd heating"
M109 S{global.hotend_temp}
echo "HotEnd Temp reached"

; retracts to avoid oozing and false the Z0 read
G91
G1 E-6	
G90

;echo "Loading and Enabling Mesh compensation"
G29 S1		; loads heatmap.csv

G28 Z

; extrudes a bit back
G91
G1 E5	
G90

; Final settings before print actually start 
; ------------------------------------------
T0  						; select tool 0
G21  						; set units to mm
M83  						; set extruder to relative mode
G92 E0.0  					; reset extruder position
M220 S100 					; reset speed multiplier

M98 P"/macros/magprobe_dock.g"

G90
G1 Z5
G1 X150 Y150
echo "Print will now start"
