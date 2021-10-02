; Macro for sampling mesh at running temps

echo "Starting MESH samplig sequence with Pre-Heat"

M98 P"/macros/led_status_load_unload.g"
echo "Starting Pre-Heating Sequence"

; Turn off noisy Extruder motor
M84 E0

M98 P"/macros/magprobe_dock.g"

M98 P"/macros/goto_bucket.g"

; sets bed temperature - do not wait
echo "Bed set to 86 C"
M140 S86

; waits for chamber temperature to reach target
echo "Chamber temp : " , sensors.analog[10].lastReading
echo "Waiting Chamber to reach 34 C"

while sensors.analog[10].lastReading < 30
	G4 S60

echo "Chamber Temp reached"

; Run QGL
M98 P"/macros/magprobe_do_QGL.g"			; level the gantry with hot bed is hot

; preheat hotend
echo "PreHeating hotend to 240 C"
M109 S240
echo "Hotend temp reached"

; cleans nozzle and Sets initial Z0
echo "Cleaning Nozzle and setting Z0 after QGL"
M98 P"/macros/do_nozzle_wipe.g"
M98 P"/macros/setZ0.g"

echo "Cooling Hotend and waiting for temps"
M104 S100
M98 P"/macros/goto_bucket.g"
M109 R100
echo "Temps reached"

M98 P"/macros/magprobe_attach.g"

echo "Setting Inductive Probe Offset"
M98 P"/macros/magprobe_set_offset.g"

M558 K0 H5 F500
echo "Starting MESH sampling"
G29			; run mesh samplig procedure
echo "MESH samplig sequence completed"

M98 P"/macros/magprobe_dock.g"

echo "Switching Heaters off now.."

; finish shut all off
M104 S0                         ; turn off hotend
M140 S0                         ; turn off heatbed
M106 P0 S0                      ; shut off blower
;M106 P3 S0                      ; shut off bay fans

M98 P"/macros/led_status_print_end.g"